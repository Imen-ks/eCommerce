//
//  FavoritesView.swift
//  eCommerce
//
//  Created by Imen Ksouri on 21/06/2023.
//

import SwiftUI

struct FavoritesView: View {
    var authenticationManager: AuthenticationManager
    var userManager: UserManager
    var productManager: ProductManager
    var discountProductManager: DiscountProductManager
    @State private var didAppear = false
    @State private var isShowingDetail = false
    @State private var selectedProduct: Product?
    @State private var selectedProductDiscount: Discount?
    @ObservedObject var viewModel: FavoriteProductsViewModel

    init(authenticationManager: AuthenticationManager,
        userManager: UserManager,
        productManager: ProductManager,
        discountProductManager: DiscountProductManager) {
        self.authenticationManager = authenticationManager
        self.userManager = userManager
        self.productManager = productManager
        self.discountProductManager = discountProductManager
        self._viewModel = .init(
            wrappedValue: FavoriteProductsViewModel(
                authenticationManager: authenticationManager,
                userManager: userManager,
                productManager: productManager,
                discountProductManager: discountProductManager
            )
        )
    }

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
                ScrollView(showsIndicators: false) {
                    ForEach(viewModel.favoriteProducts) { product in
                        ProductCellViewBuilder(
                            productId: product.id,
                            discountId: product.id,
                            imageName: "heart.fill",
                            color: .red,
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
                    }
                }
                .padding(.horizontal)
                .navigationTitle("Favorites")
                .navigationBarTitleDisplayMode(.inline)
                .navigationDestination(isPresented: $isShowingDetail, destination: {
                    if let selectedProduct {
                        ProductDetailView(
                            authenticationManager: authenticationManager,
                            userManager: userManager,
                            product: selectedProduct,
                            discount: selectedProductDiscount
                        )
                    }
                })
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
                authenticationManager: AuthenticationManager(),
                userManager: UserManager(),
                productManager: ProductManager(),
                discountProductManager: DiscountProductManager()
            )
        }
    }
}
