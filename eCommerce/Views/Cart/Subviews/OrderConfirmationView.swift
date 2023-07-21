//
//  OrderConfirmationView.swift
//  eCommerce
//
//  Created by Imen Ksouri on 14/07/2023.
//

import SwiftUI

struct OrderConfirmationView: View {
    let orderId: String

    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("Order confirmed: ") +
            Text(orderId)
                .fontWeight(.bold)
            Text("You can retrieve all your orders in your profile under the section ") +
            Text("My Orders")
                .underline()
        }
        .font(.custom(AppFont.regularFont, size: 18))
        .foregroundColor(RCValues.shared
            .color(forKey: .primary))
        .padding(.horizontal)
        .padding(.top)
    }
}

struct OrderConfirmationView_Previews: PreviewProvider {
    static var previews: some View {
        OrderConfirmationView(orderId: "F00428C2-5BE8-4CBC-A1B3-765602B97ACB")
    }
}
