//
//  OrderItemCellView.swift
//  eCommerce
//
//  Created by Imen Ksouri on 15/07/2023.
//

import SwiftUI

struct OrderItemRowView: View {
    let item: OrderItem

    var body: some View {
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
                .padding(.top)
                HStack {
                    Text("Quantity:")
                        .foregroundColor(Color(UIColor.secondaryLabel))
                    Text("\(item.quantity)")
                        .foregroundColor(RCValues.shared
                            .color(forKey: .primary))
                    Spacer()
                    Text("$\(Double(item.quantity) * item.price, specifier: "%.2f")")
                        .font(.custom(AppFont.boldFont, size: 12))
                        .foregroundColor(RCValues.shared
                            .color(forKey: .primary))
                }
                .font(.custom(AppFont.regularFont, size: 12))
            }
        }
        .frame(height: 140)
    }
}

struct OrderItemCellView_Previews: PreviewProvider {
    static var previews: some View {
        OrderItemRowView(item: OrderItem(
            id: "",
            orderId: "",
            name: ProductDatabase.products[0].name,
            brand: ProductDatabase.products[0].brand,
            size: "M",
            price: ProductDatabase.products[0].price,
            quantity: 1,
            colorName: ProductDatabase.products[0].variants[0].colorName,
            imageUrl: ProductDatabase.products[0].variants[0].imageUrl))
        .padding(.horizontal)
    }
}
