//
//  CheckoutPaymentButtonContentView.swift
//  eCommerce
//
//  Created by Imen Ksouri on 14/07/2023.
//

import SwiftUI

struct CheckoutPaymentButtonContentView: View {
    let text: String
    let background: Color

    var body: some View {
        Text(text)
            .font(.custom(AppFont.regularFont, size: 20))
            .frame(width: 250)
            .padding()
            .frame(height: 45)
            .foregroundColor(.white)
            .background(background)
            .cornerRadius(10)
    }
}

struct CheckoutPaymentButtonContentView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutPaymentButtonContentView(text: "Proceed with Payment", background: .black)
    }
}
