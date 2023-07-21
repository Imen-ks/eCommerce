//
//  AddToCartButtonView.swift
//  eCommerce
//
//  Created by Imen Ksouri on 05/07/2023.
//

import SwiftUI

struct AddToCartButtonView: View {
    var action: () -> Void

    var body: some View {
        Button {
            withAnimation {
                action()
            }
        } label: {
            VStack {
                Image(systemName: "bag")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20)
                    .padding()
                    .background(.black)
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .mask(Circle())
                Text("Add to Cart")
                    .font(.custom(AppFont.regularFont, size: 10))
                    .foregroundColor(RCValues.shared
                        .color(forKey: .primary))
            }
        }
    }
}

struct AddToCartButtonView_Previews: PreviewProvider {
    static var previews: some View {
        AddToCartButtonView() {}
    }
}
