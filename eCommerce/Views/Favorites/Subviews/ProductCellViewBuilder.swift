//
//  ProductCellViewBuilder.swift
//  eCommerce
//
//  Created by Imen Ksouri on 03/07/2023.
//

import SwiftUI

// View builder for Favorites View
struct ProductCellViewBuilder: View {
    private let authenticationManager: AuthenticationManager
    private let userManager: UserManager
    private let productManager: ProductManager
    private let discountProductManager: DiscountProductManager
    let productId: String
    let discountId: String
    @State private var product: Product? = nil
    @State private var discount: Discount? = nil
    @State private var productImageUrl: String? = nil

    init(
        authenticationManager: AuthenticationManager,
        userManager: UserManager,
        productManager: ProductManager,
        discountProductManager: DiscountProductManager,
        productId: String,
        discountId: String
    ) {
        self.authenticationManager = authenticationManager
        self.userManager = userManager
        self.productManager = productManager
        self.discountProductManager = discountProductManager
        self.productId = productId
        self.discountId = discountId
    }
    
    var body: some View {
        ZStack {
            if let product {
                ProductCellView(
                    authenticationManager: authenticationManager,
                    userManager: userManager,
                    product: product,
                    productImageUrl: productImageUrl,
                    discount: discount
                )
            }
        }
        .task {
            defer {
                self.productImageUrl = self.product?.variants.first?.imageUrl
            }
            self.product = try? await productManager.getProduct(productId: productId)
            self.discount = try? await discountProductManager.getDiscount(productId: productId)
        }
    }
}

struct ProductCellViewBuilder_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView {
            ProductCellViewBuilder(
                authenticationManager: AuthenticationManager(),
                userManager: UserManager(),
                productManager: ProductManager(),
                discountProductManager: DiscountProductManager(),
                productId: "10001",
                discountId: "10001"
            )
        }
        .padding(.horizontal)
        .listStyle(.inset)
    }
}
