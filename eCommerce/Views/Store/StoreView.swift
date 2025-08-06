//
//  StoreView.swift
//  eCommerce
//
//  Created by Imen Ksouri on 21/06/2023.
//

import SwiftUI

struct StoreView: View {
    var authenticationManager: AuthenticationManager
    var userManager: UserManager
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

    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                StoreRowView(title: "All", image: "allCategories") {
                    isSelectingAll = true
                    selectedCategory = nil
                }
                .padding(.bottom, 2)
                VStack(spacing: 10) {
                    ForEach(categories, id: \.category) { category in
                        StoreRowView(title: category.category.rawValue, image: category.image) {
                            isSelectingCategory = true
                            selectedCategory = category.category
                            isSelectingAll = false
                        }
                    }
                }
            }
            .navigationTitle("Store")
            .navigationBarTitleDisplayMode(.inline)
            .searchable(text: $searchText)
            .padding(.horizontal)
            .navigationDestination(isPresented: $isSelectingAll) {
                ProductsListView(
                    authenticationManager: authenticationManager,
                    userManager: userManager,
                    productManager: productManager,
                    discountProductManager: discountProductManager,
                    category: selectedCategory,
                    subCategory: nil,
                    showDiscountedProducts: false,
                    showNewInProducts: false
                )
            }
            .navigationDestination(isPresented: $isSelectingCategory) {
                CategoriesListView(
                    authenticationManager: authenticationManager,
                    userManager: userManager,
                    productManager: productManager,
                    discountProductManager: discountProductManager,
                    category: selectedCategory
                )
            }
        }
    }
}

struct StoreView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            StoreView(
                authenticationManager: AuthenticationManager(),
                userManager: UserManager(),
                productManager: ProductManager(),
                discountProductManager: DiscountProductManager()
            )
        }
    }
}
