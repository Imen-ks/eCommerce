//
//  FeaturedProductCellView.swift
//  eCommerce
//
//  Created by Imen Ksouri on 16/07/2023.
//

import SwiftUI

struct FeaturedProductCellView: View {
    let product: Product
    let discount: Discount?

    var body: some View {
        VStack {
            AsyncImage(url: URL(string: product.variants.map { $0.imageUrl }.first ?? "")) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIScreen.main.bounds.width / 3 - 15, height: 150)
                    .cornerRadius(5)
            } placeholder: {
                ProgressView()
            }
            .frame(width: UIScreen.main.bounds.width / 3 - 15, height: 150)
            .overlay(alignment: .bottomLeading) {
                if let discount {
                    DiscountTagView(discount: discount)
                } else if product.isNewIn ?? false {
                    NewInTagView()
                }
            }
            VStack(alignment: .leading, spacing: 5) {
                HStack {
                    Text(product.brand)
                    Spacer()
                }
                Text(product.name)
                    .lineLimit(2)
                ProductPriceView(product: product, discount: discount)
            }
            .font(.custom(AppFont.regularFont, size: 15))
            .foregroundColor(RCValues.shared
                .color(forKey: .primary))
        }
        .frame(width: UIScreen.main.bounds.width / 3 - 15)
    }
}

struct FeaturedDiscountedProductsView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            FeaturedProductCellView(
                product: ProductDatabase.products[0],
                discount: Discount(id: ProductDatabase.products[0].id, discountPercent: 50))
            FeaturedProductCellView(
                product: ProductDatabase.products[0],
                discount: nil)
            
        }
    }
}
