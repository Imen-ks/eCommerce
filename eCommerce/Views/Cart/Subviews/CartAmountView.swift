//
//  CartAmountView.swift
//  eCommerce
//
//  Created by Imen Ksouri on 05/07/2023.
//

import SwiftUI

struct CartAmountView: View {
    let cartItems: [CartItem]
    let cart: Cart?

    var body: some View {
        VStack {
            HStack {
                Text("Sub Total")
                    .font(.custom(AppFont.regularFont, size: 13))
                Spacer()
                Text("$\(cartItems.reduce(0, { $0 + Double($1.quantity) * $1.price }), specifier: "%.2f")")
                    .font(.custom(AppFont.boldFont, size: 13))
            }
            .foregroundColor(RCValues.shared
                .color(forKey: .primary))
            .padding(.top, 10)
            
            HStack {
                Text("Freight costs")
                    .font(.custom(AppFont.regularFont, size: 13))
                Spacer()
                Text("$\(cart?.freightCosts ?? 0, specifier: "%.2f")")
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
                Text(cart?.discountAmount ?? 0 > 0 ? "- $\(cart?.discountAmount ?? 0, specifier: "%.2f")" : "$\(cart?.discountAmount ?? 0, specifier: "%.2f")")
                    .font(.custom(AppFont.boldFont, size: 13))
                    .foregroundColor(cart?.discountAmount ?? 0 > 0 ? .red : RCValues.shared
                        .color(forKey: .primary))
            }
            .padding(.top, 5)
            
            Divider()
                .padding(.vertical, 5)
            
            HStack {
                Text("Net Amount")
                Spacer()
                Text("$\(cart?.totalAmount ?? 0, specifier: "%.2f")")
            }
            .font(.custom(AppFont.boldFont, size: 16))
            .foregroundColor(RCValues.shared
                .color(forKey: .primary))
            .padding(.bottom, 5)
        }
    }
}

struct CartAmountView_Previews: PreviewProvider {
    static var previews: some View {
        CartAmountView(cartItems: [], cart: nil)
            .padding(.horizontal, 15)
    }
}
