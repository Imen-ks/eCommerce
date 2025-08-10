//
//  ProductsListView.swift
//  eCommerce
//
//  Created by Imen Ksouri on 27/06/2023.
//

import SwiftUI

struct ProductsListView: View {
    private let authenticationManager: AuthenticationManager
    private let userManager: UserManager
    @ObservedObject var viewModel: ProductsViewModel

    init(
        authenticationManager: AuthenticationManager,
        userManager: UserManager,
        productManager: ProductManager,
        discountProductManager: DiscountProductManager,
        category: MasterCategory?,
        subCategory: SubCategory?,
        showDiscountedProducts: Bool,
        showNewInProducts: Bool
    ) {
        self.authenticationManager = authenticationManager
        self.userManager = userManager
        self._viewModel = .init(wrappedValue: ProductsViewModel(
            authenticationManager: authenticationManager,
            userManager: userManager,
            productManager: productManager,
            discountProductManager: discountProductManager,
            category: category,
            subCategory: subCategory,
            showDiscountedProducts: showDiscountedProducts,
            showNewInProducts: showNewInProducts)
        )
    }
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            ForEach(viewModel.products) { product in
                NavigationLink {
                    ProductDetailView(
                        authenticationManager: authenticationManager,
                        userManager: userManager,
                        product: product,
                        discount: viewModel.getDiscountForProduct(product)
                    )
                } label: {
                    ProductCellView(
                        authenticationManager: authenticationManager,
                        userManager: userManager,
                        product: product,
                        productImageUrl: product.variants.map { $0.imageUrl }.first,
                        discount: viewModel.getDiscountForProduct(product)
                    )
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
        .navigationTitle(viewModel.subCategory?.rawValue ?? "")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ProductsListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ProductsListView(
                authenticationManager: AuthenticationManager(),
                userManager: UserManager(),
                productManager: ProductManager(),
                discountProductManager: DiscountProductManager(),
                category: .accessories,
                subCategory: .belts,
                showDiscountedProducts: false,
                showNewInProducts: false
            )
        }
    }
}
