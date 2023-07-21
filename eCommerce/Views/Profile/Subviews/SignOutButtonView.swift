//
//  SignOutButtonView.swift
//  eCommerce
//
//  Created by Imen Ksouri on 08/07/2023.
//

import SwiftUI

struct SignOutButtonView: View {
    let action: () -> Void

    var body: some View {
        VStack {
            VStack {
                LabeledContent {
                    Button {
                        action()
                    } label: {
                        Text("Sign Out")
                            .padding(.vertical, 12)
                            .font(.custom(AppFont.semiBoldFont, size: 18))
                            .frame(maxWidth: .infinity)
                            .background(.black)
                            .cornerRadius(10)
                    }                    
                    .foregroundColor(.white)
                    .padding(.leading, 10)
                } label: {
                    Image(systemName: "rectangle.portrait.and.arrow.right")
                        .foregroundColor(RCValues.shared
                            .color(forKey: .accent))
                        .frame(width: 20)
                }
                .padding(.horizontal)
            }
            .padding(.vertical, 10)
            Divider()
        }
    }
}

struct SignOutButtonView_Previews: PreviewProvider {
    static var previews: some View {
        SignOutButtonView() {}
    }
}
