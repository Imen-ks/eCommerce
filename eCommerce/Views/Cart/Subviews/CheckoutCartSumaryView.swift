//
//  CheckoutCartSumaryView.swift
//  eCommerce
//
//  Created by Imen Ksouri on 13/07/2023.
//

import SwiftUI

struct CheckoutCartSumaryView: View {
    let numberOfArticles: Int
    let totalAmount: Double

    var body: some View {
        VStack{
            VStack(spacing: 15) {
                Divider()
                HStack {
                    Text("MY CART SUMMARY")
                        .font(.custom(AppFont.semiBoldFont, size: 15))
                    Spacer()
                }
                HStack {
                    Text("\(numberOfArticles) articles")
                    Spacer()
                    Text("$\(totalAmount, specifier: "%.2f")")
                }
                .font(.custom(AppFont.semiBoldFont, size: 20))
                .frame(maxWidth: .infinity)
                .padding(.trailing, 20)
            }
            .padding(.leading, 25)
            .padding(.bottom)
        }
        .background(RCValues.shared
            .color(forKey: .tabBarBackground))
        .foregroundColor(RCValues.shared
            .color(forKey: .primary))
        .padding(.top)
    }
}

struct CheckoutCartSumaryView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutCartSumaryView(numberOfArticles: 2, totalAmount: 169)
    }
}
