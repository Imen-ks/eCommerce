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
    private let discountProductManager: DiscountProductManager
    var category: MasterCategory?

    init(
        authenticationManager: AuthenticationManager,
        userManager: UserManager,
        productManager: ProductManager,
        discountProductManager: DiscountProductManager,
        category: MasterCategory?
    ) {
        self.authenticationManager = authenticationManager
        self.userManager = userManager
        self.productManager = productManager
        self.discountProductManager = discountProductManager
        self.category = category
    }

    var body: some View {
        List {
            NavigationLink {
                ProductsListView(
                    authenticationManager: authenticationManager,
                    userManager: userManager,
                    productManager: productManager,
                    discountProductManager: discountProductManager,
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
                                    discountProductManager: discountProductManager,
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
                discountProductManager: DiscountProductManager(),
                category: .accessories
            )
        }
    }
}
