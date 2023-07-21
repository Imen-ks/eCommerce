//
//  CartItemRowView.swift
//  eCommerce
//
//  Created by Imen Ksouri on 05/07/2023.
//

import SwiftUI

struct CartItemRowView: View {
    let item: CartItem
    let removeItemAction: () -> Void
    let decreaseQuantityAction: () -> Void
    let increaseQuantityAction: () -> Void

    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            HStack(alignment: .top, spacing: 18) {
                AsyncImage(url: URL(string: item.imageUrl)) { image in
                    image
                        .resizable()
                        .scaledToFill()
                } placeholder: {
                    ProgressView()
                }
                .frame(width: UIScreen.main.bounds.width / 4, height: 120)
                VStack(alignment: .leading) {
                    HStack(alignment: .top) {
                        Text(item.brand)
                            .font(.custom(AppFont.semiBoldFont, size: 15))
                            .foregroundColor(RCValues.shared
                                .color(forKey: .primary))
                        Spacer()
                        RemoveCartItemButtonView {
                            removeItemAction()
                        }
                    }
                    Text(item.name)
                        .font(.custom(AppFont.regularFont, size: 12))
                        .foregroundColor(RCValues.shared
                            .color(forKey: .primary))
                        .frame(width: 220, alignment: .leading)
                        .lineLimit(1)
                    VStack(alignment: .leading) {
                        HStack {
                            Text("Color:")
                                .foregroundColor(Color(UIColor.secondaryLabel))
                            Text(item.colorName)
                                .foregroundColor(RCValues.shared
                                    .color(forKey: .primary))
                        }
                        HStack {
                            Text("Size:")
                                .foregroundColor(Color(UIColor.secondaryLabel))
                            Text(item.size)
                                .foregroundColor(RCValues.shared
                                    .color(forKey: .primary))
                        }
                    }
                    .font(.custom(AppFont.regularFont, size: 12))
                    .padding(.top, -5)
                    HStack {
                        DecreaseQuantityButtonView {
                            decreaseQuantityAction()
                        }
                        Text("\(item.quantity)")
                            .foregroundColor(RCValues.shared
                                .color(forKey: .primary))
                        IncreaseQuantityButtonView {
                            increaseQuantityAction()
                        }
                    }
                    .font(.custom(AppFont.regularFont, size: 12))
                    .background(Color(UIColor.quaternarySystemFill))
                }
            }
            .frame(height: 120)
            Text("$\(Double(item.quantity) * item.price, specifier: "%.2f")")
                .font(.custom(AppFont.boldFont, size: 12))
                .foregroundColor(RCValues.shared
                    .color(forKey: .primary))
        }
        .frame(height: 140)
    }
}

struct CartItemRowView_Previews: PreviewProvider {
    static var product = ProductDatabase.products[0]
    static var previews: some View {
        ScrollView {
            CartItemRowView(item: CartItem(id: product.id,
                                           name: product.name,
                                           brand: product.brand,
                                           size: "M",
                                           price: product.price,
                                           discountPercent: 30,
                                           quantity: 2,
                                           colorName: product.variants.map{ $0.colorName }.first!,
                                           imageUrl: product.variants.map{ $0.imageUrl }.first!,
                                           dateAdded: Date()),
                            removeItemAction: {},
                            decreaseQuantityAction: {},
                            increaseQuantityAction: {})
        }
        .padding(.horizontal, 15)
    }
}
