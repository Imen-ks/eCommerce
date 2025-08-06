//
//  ProductDetailView.swift
//  eCommerce
//
//  Created by Imen Ksouri on 02/07/2023.
//

import SwiftUI

struct ProductDetailView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var didAppear = false
    @State private var showAlert = false
    @State private var showModal = false
    @State private var settingsDetent = PresentationDetent.medium
    @ObservedObject var viewModel: ProductViewModel

    init(authenticationManager: AuthenticationManager,
        userManager: UserManager,
        product: Product,
        discount: Discount?) {
        self._viewModel = .init(
            wrappedValue: ProductViewModel(
                authenticationManager: authenticationManager,
                userManager: userManager,
                product: product,
                discount: discount
            )
        )
    }

    var body: some View {
        ScrollView(showsIndicators: false) {
            ZStack(alignment: .bottom) {
                Color.white
                VStack {
                    AsyncImage(url: URL(string: viewModel.product.variants.map { $0.imageUrl }[viewModel.selectedVariant])) { image in
                        image
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(10)
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: UIScreen.main.bounds.width, height: 400)
                    .overlay(alignment: .topTrailing) {
                        AddToFavoriteButtonView(
                            imageName: viewModel.favoriteProducts.map { $0.id }.contains(viewModel.product.id) ? "heart.fill" : "heart",
                            color: viewModel.favoriteProducts.map { $0.id }.contains(viewModel.product.id) ? .red : .gray,
                            action: {
                                viewModel.favoriteProducts.map { $0.id }.contains(viewModel.product.id)
                                ? viewModel.removeFavoriteProduct(productId: viewModel.product.id)
                                : viewModel.addFavoriteProduct(productId: viewModel.product.id)
                        })
                        .padding([.top, .trailing])

                    }
                    .overlay(alignment: .topLeading) {
                        if let discount = viewModel.discount {
                            DiscountTagView(discount: discount)
                        } else if viewModel.product.isNewIn ?? false {
                            NewInTagView()
                        }
                    }
                    VStack(alignment: .leading) {
                        VStack(alignment: .leading) {
                            HStack(spacing: 0) {
                                Text("Color: ")
                                Text(viewModel.product.variants.map { $0.colorName }[viewModel.selectedVariant])
                                    .fontWeight(.bold)
                            }
                            .font(.footnote)
                            
                            HStack(spacing: 5) {
                                ForEach(viewModel.product.variants.map { $0.imageUrl }, id: \.self) { url in
                                    ProductVariantsImageView(
                                        url: url,
                                        opacity: viewModel.selectedVariant == viewModel.getVariantIndex(url: url) ? 1 : 0) {
                                            viewModel.selectedVariant = viewModel.getVariantIndex(url: url)
                                    }
                                }
                                Spacer()
                            }
                        }

                        VStack(alignment: .leading) {
                            Text(viewModel.product.brand)
                                .font(.custom(AppFont.lightFont, size: 15))
                            
                            Text(viewModel.product.name)
                                .font(.custom(AppFont.boldFont, size: 15))
                            
                            ProductPriceView(product: viewModel.product, discount: viewModel.discount)
                                .padding(.vertical, 1)
                        }

                        ScrollView(.horizontal, showsIndicators: false) {
                            VStack(alignment: .leading) {
                                Text("Select your size")
                                    .font(.custom(AppFont.semiBoldFont, size: 13))
                                    .padding(.top)
                                    .padding(.bottom, 1)
                                
                                HStack(spacing: 10) {
                                    ForEach(viewModel.product.sizes, id: \.self) { size in
                                        SelectSizeView(
                                            size: size,
                                            background: viewModel.selectedSize == viewModel.getSizeIndex(size: size) ? .black : RCValues.shared
                                                .color(forKey: .secondary),
                                            foregroundColor: viewModel.selectedSize == viewModel.getSizeIndex(size: size) ? .white : RCValues.shared
                                                .color(forKey: .primary)) {
                                                    viewModel.selectedSize = viewModel.getSizeIndex(size: size)
                                        }
                                    }
                                }
                            }
                        }

                        DisclosureGroup("Description") {
                            HStack {
                                Text(viewModel.product.description)
                                    .font(.custom(AppFont.lightFont, size: 13))
                                Spacer()
                            }
                        }
                        .padding(.vertical)
                        .padding(.bottom)
                        .font(.custom(AppFont.semiBoldFont, size: 13))

                        Spacer()

                    }
                    .foregroundColor(RCValues.shared
                        .color(forKey: .primary))
                    .padding()
                    .background(.white)
                    .cornerRadius(20)
                    .offset(y: -30)
                }
                AddToCartButtonView {
                    if viewModel.selectedSize == nil {
                        showAlert.toggle()
                    } else {
                        viewModel.addToCart(product: viewModel.product, discount: viewModel.discount)
                        showAlert.toggle()
                    } 
                }
                .alert(isPresented: $showAlert) {
                    Alert(title: Text(viewModel.selectedSize == nil ? "Missing information" : "Information"), message: Text(viewModel.selectedSize == nil ? "Please select your size" : "This item has been added to your cart"), dismissButton: .default(Text("OK")) {
                        if viewModel.selectedSize != nil {
                            dismiss()
                        }
                    })
                }
            }
        }
        .onAppear {
            if !didAppear {
                viewModel.addListenerForFavorites()
                viewModel.addListenerForCartItems()
                didAppear = true
            }
            viewModel.selectedVariant = 0
            viewModel.selectedSize = nil
            viewModel.logEventViewItem()
        }
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView(
            authenticationManager: AuthenticationManager(),
            userManager: UserManager(),
            product: ProductDatabase.products[0],
            discount: Discount(
                id: ProductDatabase.products[0].id,
                discountPercent: 50)
        )
    }
}
