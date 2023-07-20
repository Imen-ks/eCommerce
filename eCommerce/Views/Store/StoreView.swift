//
//  StoreView.swift
//  eCommerce
//
//  Created by Imen Ksouri on 21/06/2023.
//

import SwiftUI

struct StoreView: View {
    var productManager: ProductManager
    var discountProductManager: DiscountProductManager
    @State private var searchText = ""
    @State private var isSelectingAll = false
    @State private var isSelectingCategory = false
    @State private var selectedCategory: MasterCategory?
    var categories = [
        (category: MasterCategory.clothes, image: "clothing"),
        (category: MasterCategory.shoes, image: "shoes"),
        (category: MasterCategory.accessories, image: "accessories")
    ]
    @ObservedObject var favoriteProductsViewModel: FavoriteProductsViewModel
    @ObservedObject var cartItemViewModel: CartItemViewModel

    var body: some View {
        NavigationStack {
            ScrollView {
                StoreRowView(title: "All", image: "all") {
                    isSelectingAll = true
                    selectedCategory = nil
                }
                .padding(.bottom, 2)
                .navigationDestination(isPresented: $isSelectingAll) {
                    ProductsListView(
                        productManager: productManager,
                        discountProductManager: discountProductManager,
                        category: selectedCategory,
                        subCategory: nil,
                        showDiscountedProducts: false,
                        showNewInProducts: false,
                        favoriteProductsViewModel: favoriteProductsViewModel,
                        cartItemViewModel: cartItemViewModel)
                }
                VStack(spacing: 10) {
                    ForEach(categories, id: \.category) { category in
                        StoreRowView(title: category.category.rawValue, image: category.image) {
                            isSelectingCategory = true
                            selectedCategory = category.category
                            isSelectingAll = false
                        }
                        .navigationDestination(isPresented: $isSelectingCategory) {
                            CategoriesListView(
                                productManager: productManager,
                                discountProductManager: discountProductManager,
                                category: selectedCategory,
                                favoriteProductsViewModel: favoriteProductsViewModel,
                                cartItemViewModel: cartItemViewModel)
                        }
                    }
                }
            }
            .navigationTitle("Store")
            .navigationBarTitleDisplayMode(.inline)
            .searchable(text: $searchText)
            .padding(.horizontal)
        }
    }
}

struct StoreView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            StoreView(
                productManager: ProductManager(),
                discountProductManager: DiscountProductManager(),
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
