//
//  FavoritesView.swift
//  eCommerce
//
//  Created by Imen Ksouri on 21/06/2023.
//

import SwiftUI

struct FavoritesView: View {
    var productManager: ProductManager
    var discountProductManager: DiscountProductManager
    @State private var didAppear = false
    @State private var isShowingDetail = false
    @State private var selectedProduct: Product?
    @State private var selectedProductDiscount: Discount?
    @ObservedObject var viewModel: FavoriteProductsViewModel
    @ObservedObject var cartItemViewModel: CartItemViewModel

    var body: some View {
        NavigationStack {
            if viewModel.favoriteProducts.isEmpty {
                VStack(spacing: 0) {
                    Image("favorites")
                        .resizable()
                        .scaledToFit()
                        .frame(width: UIScreen.main.bounds.width / 2)
                    Text("Your favorite list is empty")
                        .font(.custom(AppFont.regularFont, size: 25))
                        .foregroundColor(RCValues.shared
                            .color(forKey: .accent))
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(RCValues.shared
                    .color(forKey: .tabBarBackground).opacity(0.5))
                .navigationTitle("Favorites")
                .navigationBarTitleDisplayMode(.inline)
                .onAppear {
                    if !didAppear {
                        viewModel.addListenerForFavorites()
                        didAppear = true
                    }
                    viewModel.getDiscounts()
                    selectedProduct = nil
                    selectedProductDiscount = nil
                }
            }
            
            else {
                ScrollView {
                    ForEach(viewModel.favoriteProducts) { product in
                        ProductCellViewBuilder(
                            productId: product.id,
                            discountId: product.id,
                            imageName: viewModel.favoriteProducts.map { $0.id }.contains(product.id) ? "heart.fill" : "heart",
                            color: viewModel.favoriteProducts.map { $0.id }.contains(product.id) ? .red : .gray,
                            productManager: productManager,
                            discountProductManager: discountProductManager) {
                                viewModel.removeFavoriteProduct(productId: product.id)
                            }
                            .onTapGesture {
                                Task {
                                    self.selectedProduct = try await viewModel.getProductForId(product.id)
                                    self.selectedProductDiscount = viewModel.getDiscountForId(product.id)
                                    isShowingDetail.toggle()
                                }
                            }
                            .navigationDestination(isPresented: $isShowingDetail, destination: {
                                if let selectedProduct {
                                    ProductDetailView(
                                        product: selectedProduct,
                                        discount: selectedProductDiscount,
                                        viewModel: cartItemViewModel)
                                }
                            })
                    }
                }
                .padding(.horizontal)
                .listStyle(.inset)
                .navigationTitle("Favorites")
                .navigationBarTitleDisplayMode(.inline)
                .onAppear {
                    if !didAppear {
                        viewModel.addListenerForFavorites()
                        didAppear = true
                    }
                    viewModel.getDiscounts()
                    selectedProduct = nil
                    selectedProductDiscount = nil
                }
            }
        }
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            FavoritesView(
                productManager: ProductManager(),
                discountProductManager: DiscountProductManager(),
                viewModel: FavoriteProductsViewModel(
                    authenticationManager: AuthenticationManager(),
                    userManager: UserManager(),
                    productManager: ProductManager(),
                    discountProductManager: DiscountProductManager()),
                cartItemViewModel: CartItemViewModel(
                    authenticationManager: AuthenticationManager(),
                    userManager: UserManager()))
        }
    }
}
