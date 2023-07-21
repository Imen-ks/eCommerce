//
//  ProductCellView.swift
//  eCommerce
//
//  Created by Imen Ksouri on 30/06/2023.
//

import SwiftUI

struct ProductCellView: View {
    let product: Product
    let imageName: String
    let color: Color
    let discount: Discount?
    var action: () -> Void

    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.white)
                .shadow(color: .secondary, radius: 2, x: 1, y: 1)
            HStack {
                AsyncImage(url: URL(string: product.variants.map { $0.imageUrl }.first ?? "")) { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: UIScreen.main.bounds.width / 2 - 15, height: 220)
                        .cornerRadius(10)
                } placeholder: {
                    ProgressView()
                }
                .frame(width: UIScreen.main.bounds.width / 2 - 15, height: 220)
                .overlay(alignment: .bottomLeading) {
                    if let discount {
                        DiscountTagView(discount: discount)
                    } else if product.isNewIn ?? false {
                        NewInTagView()
                    }
                }
                
                VStack(alignment: .leading) {
                    Text(product.name)
                        .font(.custom(AppFont.semiBoldFont, size: 15))
                        .lineLimit(2)
                    Text(product.brand)
                        .font(.custom(AppFont.lightFont, size: 15))
                        .padding(.top, 1)
                    ProductVariantsColorView(product: product)
                    Spacer()                    
                    HStack {
                        ProductPriceView(product: product, discount: discount)
                        Spacer()
                        AddToFavoriteButtonView(imageName: imageName, color: color) {
                            action()
                        }
                    }
                    .padding(.bottom, 10)
                }
                .foregroundColor(RCValues.shared
                    .color(forKey: .primary))
                Spacer()
            }
            .padding(.vertical, 5)
        }
    }
}

struct ProductCellView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView {
            ProductCellView(product: ProductDatabase.products[0],
                            imageName: "heart.fill",
                            color: .red,
                            discount: Discount(
                                id: ProductDatabase.products[0].id, discountPercent: 50)) {}
        }
    }
}
