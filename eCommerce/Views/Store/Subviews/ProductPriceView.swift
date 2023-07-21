//
//  ProductPriceView.swift
//  eCommerce
//
//  Created by Imen Ksouri on 05/07/2023.
//

import SwiftUI

struct ProductPriceView: View {
    let product: Product
    let discount: Discount?

    var body: some View {
        if let discount {
            VStack(alignment: .leading) {
                Text("$\(product.price, specifier: "%.2f")")
                    .font(.custom(AppFont.boldFont, size: 15))
                    .foregroundColor(RCValues.shared
                        .color(forKey: .primary))
                    .strikethrough()
                Text("$\(product.price * (1 - discount.discountPercent / 100), specifier: "%.2f")")
                    .font(.custom(AppFont.boldFont, size: 15))
                    .foregroundColor(.red)
                
            }
        } else {
            Text("$\(product.price, specifier: "%.2f")")
                .font(.custom(AppFont.boldFont, size: 15))
                .foregroundColor(RCValues.shared
                    .color(forKey: .primary))
                .padding(.bottom, 15)
        }
    }
}

struct ProductPriceView_Previews: PreviewProvider {
    static var previews: some View {
        ProductPriceView(product: ProductDatabase.products[0],
                         discount: Discount(
                             id: ProductDatabase.products[0].id, discountPercent: 50))
    }
}
