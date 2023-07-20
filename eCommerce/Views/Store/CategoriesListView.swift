//
//  CategoriesListView.swift
//  eCommerce
//
//  Created by Imen Ksouri on 25/06/2023.
//

import SwiftUI

struct CategoriesListView: View {
    var productManager: ProductManager
    var discountProductManager: DiscountProductManager
    var category: MasterCategory? = nil
    @ObservedObject var favoriteProductsViewModel: FavoriteProductsViewModel
    @ObservedObject var cartItemViewModel: CartItemViewModel

    var body: some View {
        List {
            NavigationLink {
                ProductsListView(
                    productManager: productManager,
                    discountProductManager: discountProductManager,
                    category: category,
                    subCategory: nil,
                    showDiscountedProducts: false,
                    showNewInProducts: false,
                    favoriteProductsViewModel: favoriteProductsViewModel,
                    cartItemViewModel: cartItemViewModel)
            } label: {
                CategoriesRowView(title: "All")
            }

            ForEach(MasterCategory.allCases, id: \.self) { masterCategory in
                if self.category != nil && self.category == masterCategory {
                    ForEach(SubCategory.allCases, id: \.self) { subcategory in
                        if subcategory.masterCategory == category {
                            NavigationLink {
                                ProductsListView(
                                    productManager: productManager,
                                    discountProductManager: discountProductManager,
                                    category: category,
                                    subCategory: subcategory,
                                    showDiscountedProducts: false,
                                    showNewInProducts: false,
                                    favoriteProductsViewModel: favoriteProductsViewModel,
                                    cartItemViewModel: cartItemViewModel)
                            } label: {
                                CategoriesRowView(title: subcategory.rawValue)
                            }
                        }
                    }
                }
            }
        }
        .listStyle(.inset)
        .navigationTitle(category?.rawValue ?? "")
        .navigationBarTitleDisplayMode(.large)
    }
}

struct CategoriesListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            CategoriesListView(
                productManager: ProductManager(),
                discountProductManager: DiscountProductManager(),
                category: .accessories,
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
