//
//  DiscountTagView.swift
//  eCommerce
//
//  Created by Imen Ksouri on 05/07/2023.
//

import SwiftUI

struct DiscountTagView: View {
    let discount: Discount?

    var body: some View {
        if let discount {
            ZStack(alignment: .center) {
                Rectangle()
                    .fill(.red)
                    .frame(width: 50, height: 25)
                Text("- \(discount.discountPercent, specifier: "%.0f")%")
                    .font(.caption)
                    .foregroundColor(.white)
                    .fontWeight(.bold)
            }
        }
    }
}

struct DiscountTagView_Previews: PreviewProvider {
    static var previews: some View {
        DiscountTagView(discount: Discount(id: "10001", discountPercent: 30))
    }
}
