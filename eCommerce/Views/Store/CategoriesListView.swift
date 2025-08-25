//
//  CategoriesListView.swift
//  eCommerce
//
//  Created by Imen Ksouri on 25/06/2023.
//

import SwiftUI

struct CategoriesListView: View {
    private let authenticationManager: AuthenticationManager
    private let userManager: UserManager
    private let productManager: ProductManager
    var category: MasterCategory?

    init(
        authenticationManager: AuthenticationManager,
        userManager: UserManager,
        productManager: ProductManager,
        category: MasterCategory?
    ) {
        self.authenticationManager = authenticationManager
        self.userManager = userManager
        self.productManager = productManager
        self.category = category
    }

    var body: some View {
        List {
            NavigationLink {
                ProductsListView(
                    authenticationManager: authenticationManager,
                    userManager: userManager,
                    productManager: productManager,
                    category: category,
                    subCategory: nil,
                    showDiscountedProducts: false,
                    showNewInProducts: false
                )
            } label: {
                CategoriesRowView(title: "All")
            }

            ForEach(MasterCategory.allCases, id: \.self) { masterCategory in
                if self.category != nil && self.category == masterCategory {
                    ForEach(SubCategory.allCases, id: \.self) { subcategory in
                        if subcategory.masterCategory == category {
                            NavigationLink {
                                ProductsListView(
                                    authenticationManager: authenticationManager,
                                    userManager: userManager,
                                    productManager: productManager,
                                    category: category,
                                    subCategory: subcategory,
                                    showDiscountedProducts: false,
                                    showNewInProducts: false
                                )
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
                authenticationManager: AuthenticationManager(),
                userManager: UserManager(),
                productManager: ProductManager(),
                category: .accessories
            )
        }
    }
}
