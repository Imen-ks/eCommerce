//
//  CheckoutButtonView.swift
//  eCommerce
//
//  Created by Imen Ksouri on 12/07/2023.
//

import SwiftUI

struct CheckoutButtonView: View {
    let action: () -> Void

    var body: some View {
        Button {
            action()
        } label: {
            Text("Checkout")
                .padding(.vertical, 12)
                .font(.custom(AppFont.semiBoldFont, size: 18))
                .frame(maxWidth: .infinity)
                .background(.black)
                .cornerRadius(10)
        }
        .foregroundColor(.white)
        .padding(.vertical)
    }
}

struct CheckoutButtonView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutButtonView() {}
    }
}
