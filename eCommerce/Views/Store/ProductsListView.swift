//
//  ProductsListView.swift
//  eCommerce
//
//  Created by Imen Ksouri on 27/06/2023.
//

import SwiftUI
import FirebaseAnalytics

struct ProductsListView: View {
    var productManager: ProductManager
    var discountProductManager: DiscountProductManager
    var category: MasterCategory?
    var subCategory: SubCategory?
    var showDiscountedProducts: Bool
    var showNewInProducts: Bool
    @State private var didAppear = false
    @StateObject var viewModel: ProductsViewModel
    @ObservedObject var favoriteProductsViewModel: FavoriteProductsViewModel
    @ObservedObject var cartItemViewModel: CartItemViewModel

    init(productManager: ProductManager,
         discountProductManager: DiscountProductManager,
         category: MasterCategory?,
         subCategory: SubCategory?,
         showDiscountedProducts: Bool,
         showNewInProducts: Bool,
         favoriteProductsViewModel: FavoriteProductsViewModel,
         cartItemViewModel: CartItemViewModel) {
        self.productManager = productManager
        self.discountProductManager = discountProductManager
        self.category = category
        self.subCategory = subCategory
        self.showDiscountedProducts = showDiscountedProducts
        self.showNewInProducts = showNewInProducts
        self._viewModel = .init(wrappedValue: ProductsViewModel(
            productManager: productManager,
            discountProductManager: discountProductManager,
            category: category,
            subCategory: subCategory))
        self.favoriteProductsViewModel = favoriteProductsViewModel
        self.cartItemViewModel = cartItemViewModel
    }
    
    var body: some View {
        ScrollView {
            ForEach(viewModel.products) { product in
                NavigationLink {
                    ProductDetailView(
                        product: product,
                        discount: viewModel.getDiscountForId(product.id),
                        viewModel: cartItemViewModel)
                } label: {
                    ProductCellView(
                        product: product,
                        imageName: favoriteProductsViewModel.favoriteProducts.map { $0.id }.contains(product.id) ? "heart.fill" : "heart",
                        color: favoriteProductsViewModel.favoriteProducts.map { $0.id }.contains(product.id) ? .red : .gray,
                        discount: viewModel.getDiscountForId(product.id)) {
                            favoriteProductsViewModel.favoriteProducts.map { $0.id }.contains(product.id)
                            ? favoriteProductsViewModel.removeFavoriteProduct(productId: product.id)
                            : favoriteProductsViewModel.addFavoriteProduct(productId: product.id)
                            FirebaseAnalytics.Analytics.logEvent(AnalyticsEventAddToWishlist, parameters: [
                                AnalyticsParameterItemBrand: product.brand,
                                AnalyticsParameterItemName: product.name,
                                AnalyticsParameterItemCategory: product.category,
                                AnalyticsParameterItemCategory2: product.subCategory,
                                AnalyticsParameterPrice: product.price,
                                AnalyticsParameterCurrency: "USD",
                                AnalyticsParameterDiscount: viewModel.getDiscountForId(product.id)?.discountPercent ?? 0
                            ])
                    }
                }
                .buttonStyle(PlainButtonStyle())
                if product == viewModel.products.last {
                    ProgressView()
                        .onAppear {
                            viewModel.getProducts()
                        }
                }
            }
        }
        .padding(.horizontal)
        .listStyle(.inset)
        .navigationTitle(subCategory?.rawValue ?? "")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            if !didAppear {
                favoriteProductsViewModel.addListenerForFavorites()
                didAppear = true
            }
            viewModel.showDiscountedProducts = showDiscountedProducts
            viewModel.showNewInProducts = showNewInProducts
            viewModel.getProducts()
            viewModel.getDiscounts()
            FirebaseAnalytics.Analytics.logEvent(AnalyticsEventViewItemList, parameters: [
                AnalyticsParameterItemCategory: category?.rawValue ?? "All",
                AnalyticsParameterItemCategory2: subCategory?.rawValue ?? "All",
            ])
        }
    }
}

struct ProductsListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ProductsListView(
                productManager: ProductManager(),
                discountProductManager: DiscountProductManager(),
                category: .accessories,
                subCategory: .belts,
                showDiscountedProducts: false,
                showNewInProducts: false,
                favoriteProductsViewModel: FavoriteProductsViewModel(
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
