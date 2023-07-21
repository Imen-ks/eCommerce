//
//  OrderCellView.swift
//  eCommerce
//
//  Created by Imen Ksouri on 15/07/2023.
//

import SwiftUI

struct OrderCellView: View {
    let order: Order

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(RCValues.shared
                    .color(forKey: .secondary))
                .shadow(color: .secondary, radius: 1, x: 1, y: 1)
            VStack(alignment: .leading) {
                HStack {
                    VStack(alignment: .leading, spacing: 5) {
                        Text("\(order.dateCreated, formatter: dateFormatter)")
                            .font(.custom(AppFont.regularFont, size: 18))
                        HStack {
                            Text("$\(order.totalAmount, specifier: "%.2f")")
                                .font(.custom(AppFont.boldFont, size: 25))
                            Spacer()
                            Image(systemName: "chevron.right")
                                .font(.custom(AppFont.regularFont, size: 20))
                                .foregroundColor(Color(UIColor.secondaryLabel))
                                .padding(.top)
                        }
                        Text("\(String(order.numberOfArticles)) ARTICLES")
                            .font(.custom(AppFont.lightFont, size: 13))
                    }
                }
                .offset(y: -5)
                Text("N° \(order.id)")
                    .font(.custom(AppFont.lightFont, size: 13))
            }
            .foregroundColor(RCValues.shared
                .color(forKey: .primary))
            .padding([.vertical, .horizontal])
        }
        .padding(.bottom)
        .padding(.horizontal, 30)
    }
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        return formatter
    }()
}

struct OrderCellView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView {
            OrderCellView(order: Order(id: UUID().uuidString,
                                       userId: UUID().uuidString,
                                       freightCosts: 0,
                                       discountAmount: 0,
                                       totalAmount: 769.6,
                                       numberOfArticles: 10,
                                       dateCreated: Date()))
            .padding(.horizontal)
        }
        .background(RCValues.shared
            .color(forKey: .tabBarBackground).opacity(0.5))
    }
}
