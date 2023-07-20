//
//  ProductCellViewBuilder.swift
//  eCommerce
//
//  Created by Imen Ksouri on 03/07/2023.
//

import SwiftUI

struct ProductCellViewBuilder: View {
    let productId: String
    let discountId: String
    let imageName: String
    let color: Color
    var productManager: ProductManager
    var discountProductManager: DiscountProductManager
    @State private var product: Product? = nil
    @State private var discount: Discount? = nil
    var action: () -> Void
    
    var body: some View {
        ZStack {
            if let product {
                ProductCellView(product: product,
                                imageName: imageName,
                                color: color,
                                discount: discount) {
                    action()
                }
            }
        }
        .task {
            self.product = try? await productManager.getProduct(productId: productId)
            self.discount = try? await discountProductManager.getDiscount(productId: productId)
        }
    }
}

struct ProductCellViewBuilder_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView {
            ProductCellViewBuilder(productId: "10001",
                                   discountId: "10001",
                                   imageName: "heart.fill",
                                   color: .red,
                                   productManager: ProductManager(),
                                   discountProductManager: DiscountProductManager()) {}
        }
        .padding(.horizontal)
        .listStyle(.inset)
    }
}
