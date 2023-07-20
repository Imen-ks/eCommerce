//
//  DecreaseQuantityButtonView.swift
//  eCommerce
//
//  Created by Imen Ksouri on 05/07/2023.
//

import SwiftUI

struct DecreaseQuantityButtonView: View {
    let action: () -> Void

    var body: some View {
        Button {
            withAnimation {
                action()
            }
        } label: {
            Image(systemName: "minus")
                .fontWeight(.bold)
                .foregroundColor(Color(UIColor.secondaryLabel))
                .frame(width: 25, height: 25)
        }
    }
}

struct DecreaseQuantityButtonView_Previews: PreviewProvider {
    static var previews: some View {
        DecreaseQuantityButtonView() {}
    }
}
