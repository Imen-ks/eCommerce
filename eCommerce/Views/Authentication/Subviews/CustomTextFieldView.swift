//
//  CustomTextFieldView.swift
//  eCommerce
//
//  Created by Imen Ksouri on 18/06/2023.
//

import SwiftUI

struct CustomTextFieldView: View {
    var title: String
    @Binding var text: String

    var body: some View {
        HStack {
            TextField(title, text: $text)
                .font(.custom(AppFont.regularFont, size: 16))
                .foregroundColor(RCValues.shared
                    .color(forKey: .primary))
                .autocapitalization(.none)
                .disableAutocorrection(true)
            if !text.isEmpty {
                Button {
                    withAnimation {
                        text = ""
                    }
                } label: {
                    Image(systemName: "x.circle.fill")
                        .foregroundColor(.secondary)
                        .opacity(0.7)
                }
            }
        }
        .padding()
        .background(Color(UIColor.secondarySystemBackground))
        .cornerRadius(10)
        .padding(.vertical, 2)
    }
}

struct CustomTextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        CustomTextFieldView(title: "First name", text: .constant("Anonymous"))
    }
}
