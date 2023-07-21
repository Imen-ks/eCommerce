//
//  OrderDetailPersonnalInfoSectionView.swift
//  eCommerce
//
//  Created by Imen Ksouri on 15/07/2023.
//

import SwiftUI

struct OrderDetailPersonnalInfoSectionView: View {
    let firstName: String
    let lastName: String
    let order: Order
    let shippingAddress: ShippingAddress

    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: UIScreen.main.bounds.width - 80, height: 180)
                .foregroundColor(.white)
            VStack {
                VStack {
                    HStack {
                        Text("\(order.dateCreated, formatter: dateFormatter)")
                        Spacer()
                        Text("\(String(order.numberOfArticles)) Articles")
                    }
                    .font(.custom(AppFont.semiBoldFont, size: 16))
                    .padding(.top)
                    .padding(.bottom, 5)
                    VStack(alignment: .leading, spacing: 5) {
                        Text("\(firstName) \(lastName)".uppercased())
                        Text("\(shippingAddress.streetNumber) \(shippingAddress.streetName)")
                        Text("\(shippingAddress.postalCode) \(shippingAddress.town)")
                        Text(shippingAddress.country.uppercased())
                            .padding(.bottom)
                    }
                }
                .font(.custom(AppFont.regularFont, size: 16))
                .foregroundColor(RCValues.shared
                    .color(forKey: .primary))
                .padding(.horizontal)
            }
            .padding(.vertical, 30)
            .padding(.horizontal, 50)
        }
        .background(Color(UIColor.secondarySystemBackground))
        .frame(width: UIScreen.main.bounds.width)
        .padding(.bottom)
    }
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        return formatter
    }()
}

struct OrderDetailPersonnalInfoSectionView_Previews: PreviewProvider {
    static var previews: some View {
        OrderDetailPersonnalInfoSectionView(
            firstName: "Jane",
            lastName: "Doe",
            order: Order(
                id: "GT69F40HK4Z5",
                userId: UUID().uuidString,
                freightCosts: 0,
                discountAmount: 22.5,
                totalAmount: 221.5,
                numberOfArticles: 2,
                dateCreated: Date()),
            shippingAddress: ShippingAddress(
                id: "",
                streetNumber: "235",
                streetName: "Oxford Street",
                postalCode: "W1D 1BS",
                town: "London",
                country: "United Kingdom"))
    }
}
