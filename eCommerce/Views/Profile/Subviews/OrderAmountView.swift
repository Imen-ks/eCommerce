//
//  OrderAmountView.swift
//  eCommerce
//
//  Created by Imen Ksouri on 15/07/2023.
//

import SwiftUI

struct OrderAmountView: View {
    let order: Order
    let orderItems: [OrderItem]

    var body: some View {
        VStack {
            HStack {
                Text("Sub Total")
                    .font(.custom(AppFont.regularFont, size: 13))
                Spacer()
                Text("$\(orderItems.reduce(0, { $0 + Double($1.quantity) * $1.price }), specifier: "%.2f")")
                    .font(.custom(AppFont.boldFont, size: 13))
            }
            .foregroundColor(RCValues.shared
                .color(forKey: .primary))
            .padding(.top, 10)
            
            HStack {
                Text("Freight costs")
                    .font(.custom(AppFont.regularFont, size: 13))
                Spacer()
                Text("$\(order.freightCosts, specifier: "%.2f")")
                    .font(.custom(AppFont.boldFont, size: 13))
            }
            .foregroundColor(RCValues.shared
                .color(forKey: .primary))
            .padding(.top, 5)
            
            HStack {
                Text("Discount")
                    .font(.custom(AppFont.regularFont, size: 13))
                    .foregroundColor(RCValues.shared
                        .color(forKey: .primary))
                Spacer()
                Text(order.discountAmount > 0 ? "- $\(order.discountAmount, specifier: "%.2f")" : "$\(order.discountAmount, specifier: "%.2f")")
                    .font(.custom(AppFont.boldFont, size: 13))
                    .foregroundColor(order.discountAmount > 0 ? .red : RCValues.shared
                        .color(forKey: .primary))
            }
            .padding(.top, 5)
            
            Divider()
                .padding(.vertical, 5)
            
            HStack {
                Text("Net Amount")
                Spacer()
                Text("$\(order.totalAmount, specifier: "%.2f")")
            }
            .font(.custom(AppFont.boldFont, size: 16))
            .foregroundColor(RCValues.shared
                .color(forKey: .primary))
            .padding(.bottom, 5)
        }
    }
}

struct OrderAmountView_Previews: PreviewProvider {
    static var previews: some View {
        OrderAmountView(
            order: Order(
                id: "GT69F40HK4Z5",
                userId: UUID().uuidString,
                freightCosts: 0,
                discountAmount: 22.5,
                totalAmount: 221.5,
                numberOfArticles: 2,
                dateCreated: Date()),
            orderItems: [
                OrderItem(
                    id: "1",
                    orderId: "GT69F40HK4Z5",
                    name: ProductDatabase.products[0].name,
                    brand: ProductDatabase.products[0].brand,
                    size: "M",
                    price: ProductDatabase.products[0].price,
                    quantity: 1,
                    colorName: ProductDatabase.products[0].variants[0].colorName,
                    imageUrl: ProductDatabase.products[0].variants[0].imageUrl),
                OrderItem(
                    id: "2",
                    orderId: "GT69F40HK4Z5",
                    name: ProductDatabase.products[1].name,
                    brand: ProductDatabase.products[1].brand,
                    size: "M",
                    price: ProductDatabase.products[1].price,
                    quantity: 1,
                    colorName: ProductDatabase.products[1].variants[0].colorName,
                    imageUrl: ProductDatabase.products[1].variants[0].imageUrl)
            ])
        .padding(.horizontal)
    }
}
