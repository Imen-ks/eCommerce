//
//  ButtonView.swift
//  eCommerce
//
//  Created by Imen Ksouri on 19/06/2023.
//

import SwiftUI

struct ButtonView: View {
    var text: String
    var backgroundColor: Color
    var foregroundColor: Color
    var action: () -> Void

    var body: some View {
        Button {
            withAnimation {
                action()
            }
        } label: {
            Text(text)
                .font(.custom(AppFont.regularFont, size: 18))
        }
        .foregroundColor(foregroundColor)
        .frame(height: 55)
        .frame(maxWidth: .infinity)
        .background(backgroundColor)
        .cornerRadius(30)
        .padding(.vertical, 20)
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(text: "Sign In", backgroundColor: .black, foregroundColor: .white) {}
    }
}
