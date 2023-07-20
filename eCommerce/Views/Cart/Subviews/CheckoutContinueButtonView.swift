//
//  CheckoutContinueButtonView.swift
//  eCommerce
//
//  Created by Imen Ksouri on 13/07/2023.
//

import SwiftUI

struct CheckoutContinueButtonView: View {
    let disabled: Bool
    let action: () -> Void

    var body: some View {
        Button {
            action()
        } label: {
            Text("Continue")
                .font(.custom(AppFont.regularFont, size: 20))
                .frame(width: 250)
            
        }
        .padding()
        .frame(height: 45)
        .foregroundColor(.white)
        .background(disabled ? .gray : .black)
        .cornerRadius(10)
        .disabled(disabled)
    }
}

struct CheckoutContinueButtonView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            CheckoutContinueButtonView(disabled: false) {}
            CheckoutContinueButtonView(disabled: true) {}
        }
    }
}
