//
//  ProductVariantsColorView.swift
//  eCommerce
//
//  Created by Imen Ksouri on 05/07/2023.
//

import SwiftUI

struct ProductVariantsColorView: View {
    let product: Product

    var body: some View {
        HStack(spacing: 0) {
            ForEach(product.variants.map { $0.color }, id: \.self) { color in
                color
                    .mask(Circle())
                    .padding(.horizontal, 5)
                    .shadow(color: RCValues.shared
                        .color(forKey: .secondary), radius: 2, x: 1, y: 1)
                    .frame(width: 30)
            }
            Spacer()
        }
    }
}

struct ProductVariantsColorView_Previews: PreviewProvider {
    static var previews: some View {
        ProductVariantsColorView(product: ProductDatabase.products[0])
    }
}
