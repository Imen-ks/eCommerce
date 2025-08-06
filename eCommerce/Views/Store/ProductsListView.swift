//
//  ProductsListView.swift
//  eCommerce
//
//  Created by Imen Ksouri on 27/06/2023.
//

import SwiftUI

struct ProductsListView: View {
    var authenticationManager: AuthenticationManager
    var userManager: UserManager
    var category: MasterCategory?
    var subCategory: SubCategory?
    var showDiscountedProducts: Bool
    var showNewInProducts: Bool
    @State private var didAppear = false
    @ObservedObject var viewModel: ProductsViewModel

    init(authenticationManager: AuthenticationManager,
        userManager: UserManager,
        productManager: ProductManager,
        discountProductManager: DiscountProductManager,
        category: MasterCategory?,
        subCategory: SubCategory?,
        showDiscountedProducts: Bool,
        showNewInProducts: Bool) {
        self.authenticationManager = authenticationManager
        self.userManager = userManager
        self.category = category
        self.subCategory = subCategory
        self.showDiscountedProducts = showDiscountedProducts
        self.showNewInProducts = showNewInProducts
        self._viewModel = .init(wrappedValue: ProductsViewModel(
            authenticationManager: authenticationManager,
            userManager: userManager,
            productManager: productManager,
            discountProductManager: discountProductManager,
            category: category,
            subCategory: subCategory))
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
                        product: product,
                        imageName: viewModel.favoriteProducts.map { $0.id }.contains(product.id) ? "heart.fill" : "heart",
                        color: viewModel.favoriteProducts.map { $0.id }.contains(product.id) ? .red : .gray,
                        discount: viewModel.getDiscountForProduct(product)) {
                            viewModel.favoriteProducts.map { $0.id }.contains(product.id)
                            ? viewModel.removeFavoriteProduct(product)
                            : viewModel.addFavoriteProduct(product)
                            
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
                viewModel.addListenerForFavorites()
                didAppear = true
            }
            viewModel.showDiscountedProducts = showDiscountedProducts
            viewModel.showNewInProducts = showNewInProducts
            viewModel.getProducts()
            viewModel.getDiscounts()
            viewModel.logEventViewItemList()
        }
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
