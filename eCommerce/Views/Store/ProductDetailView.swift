//
//  ProductDetailView.swift
//  eCommerce
//
//  Created by Imen Ksouri on 02/07/2023.
//

import SwiftUI
import FirebaseAnalytics

struct ProductDetailView: View {
    @Environment(\.dismiss) private var dismiss
    let product: Product
    let discount: Discount?
    @State private var didAppear = false
    @State private var showAlert = false
    @State private var showModal = false
    @State private var settingsDetent = PresentationDetent.medium
    @ObservedObject var viewModel: CartItemViewModel

    var body: some View {
        ScrollView {
            ZStack(alignment: .bottom) {
                Color.white
                VStack {
                    AsyncImage(url: URL(string: product.variants.map { $0.imageUrl }[viewModel.selectedVariant])) { image in
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
                            imageName: viewModel.favoriteProducts.map { $0.id }.contains(product.id) ? "heart.fill" : "heart",
                            color: viewModel.favoriteProducts.map { $0.id }.contains(product.id) ? .red : .gray,
                            action: {
                                viewModel.favoriteProducts.map { $0.id }.contains(product.id)
                                ? viewModel.removeFavoriteProduct(productId: product.id)
                                : viewModel.addFavoriteProduct(productId: product.id)
                                FirebaseAnalytics.Analytics.logEvent(AnalyticsEventAddToWishlist, parameters: [
                                    AnalyticsParameterItemBrand: product.brand,
                                    AnalyticsParameterItemName: product.name,
                                    AnalyticsParameterItemCategory: product.category,
                                    AnalyticsParameterItemCategory2: product.subCategory,
                                    AnalyticsParameterPrice: product.price,
                                    AnalyticsParameterCurrency: "USD",
                                    AnalyticsParameterDiscount: discount?.discountPercent ?? 0
                                ])
                        })
                        .padding([.top, .trailing])

                    }
                    .overlay(alignment: .topLeading) {
                        if let discount {
                            DiscountTagView(discount: discount)
                        } else if product.isNewIn ?? false {
                            NewInTagView()
                        }
                    }
                    VStack(alignment: .leading) {
                        VStack(alignment: .leading) {
                            HStack(spacing: 0) {
                                Text("Color: ")
                                Text(product.variants.map { $0.colorName }[viewModel.selectedVariant])
                                    .fontWeight(.bold)
                            }
                            .font(.footnote)
                            
                            HStack(spacing: 5) {
                                ForEach(product.variants.map { $0.imageUrl }, id: \.self) { url in
                                    ProductVariantsImageView(
                                        url: url,
                                        opacity: viewModel.selectedVariant == getVariantIndex(url: url) ? 1 : 0) {
                                            viewModel.selectedVariant = getVariantIndex(url: url)
                                    }
                                }
                                Spacer()
                            }
                        }

                        VStack(alignment: .leading) {
                            Text(product.brand)
                                .font(.custom(AppFont.lightFont, size: 15))
                            
                            Text(product.name)
                                .font(.custom(AppFont.boldFont, size: 15))
                            
                            ProductPriceView(product: product, discount: discount)
                                .padding(.vertical, 1)
                        }

                        ScrollView(.horizontal) {
                            VStack(alignment: .leading) {
                                Text("Select your size")
                                    .font(.custom(AppFont.semiBoldFont, size: 13))
                                    .padding(.top)
                                    .padding(.bottom, 1)
                                
                                HStack(spacing: 10) {
                                    ForEach(product.sizes, id: \.self) { size in
                                        SelectSizeView(
                                            size: size,
                                            background: viewModel.selectedSize == getSizeIndex(size: size) ? .black : RCValues.shared
                                                .color(forKey: .secondary),
                                            foregroundColor: viewModel.selectedSize == getSizeIndex(size: size) ? .white : RCValues.shared
                                                .color(forKey: .primary)) {
                                                viewModel.selectedSize = getSizeIndex(size: size)
                                        }
                                    }
                                }
                            }
                        }

                        DisclosureGroup("Description") {
                            HStack {
                                Text(product.description)
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
                        viewModel.addToCart(product: product, discount: discount)
                        showAlert.toggle()
                        FirebaseAnalytics.Analytics.logEvent(AnalyticsEventAddToCart, parameters: [
                            AnalyticsParameterItemBrand: product.brand,
                            AnalyticsParameterItemName: product.name,
                            AnalyticsParameterItemCategory: product.category,
                            AnalyticsParameterItemCategory2: product.subCategory,
                            AnalyticsParameterItemVariant: product.variants[viewModel.selectedVariant].colorName,
                            AnalyticsParameterPrice: product.price,
                            AnalyticsParameterCurrency: "USD",
                            AnalyticsParameterDiscount: discount?.discountPercent ?? 0
                        ])
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
            FirebaseAnalytics.Analytics.logEvent(AnalyticsEventViewItem, parameters: [
                AnalyticsParameterItemBrand: product.brand,
                AnalyticsParameterItemName: product.name,
                AnalyticsParameterItemCategory: product.category,
                AnalyticsParameterItemCategory2: product.subCategory,
                AnalyticsParameterPrice: product.price,
                AnalyticsParameterCurrency: "USD",
                AnalyticsParameterDiscount: discount?.discountPercent ?? 0
            ])
        }
    }
    private func getVariantIndex(url : String) -> Int {
        let urls = product.variants.map { $0.imageUrl }
        guard let index = urls.firstIndex(of: url) else {
            return 0
        }
        return index
    }

    private func getSizeIndex(size : String) -> Int {
        let sizes = product.sizes
        guard let index = sizes.firstIndex(of: size) else {
            return 0
        }
        return index
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView(
            product: ProductDatabase.products[0],
            discount: Discount(
                id: ProductDatabase.products[0].id,
                discountPercent: 50),
            viewModel: CartItemViewModel(
                authenticationManager: AuthenticationManager(),
                userManager: UserManager()))
    }
}
