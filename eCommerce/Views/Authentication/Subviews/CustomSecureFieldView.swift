//
//  CustomSecureFieldView.swift
//  eCommerce
//
//  Created by Imen Ksouri on 18/06/2023.
//

import SwiftUI

struct CustomSecureFieldView: View {
    @State private var showPassword = false
    @FocusState var inFocus: Field?
    var title: String
    @Binding var text: String

    enum Field {
        case secure, plain
    }

    var body: some View {
        HStack {
            if showPassword {
                TextField(title, text: $text)
                    .font(.custom(AppFont.regularFont, size: 16))
                    .foregroundColor(RCValues.shared
                        .color(forKey: .primary))
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .focused($inFocus, equals: .plain)
            } else {
                SecureField(title, text: $text)
                    .foregroundColor(RCValues.shared
                        .color(forKey: .primary))
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .focused($inFocus, equals: .secure)
            }
            Button {
                withAnimation {
                    showPassword.toggle()
                    inFocus = showPassword ? .plain : .secure
                }
            } label: {
                Image(systemName: showPassword ? "eye.slash" : "eye")
                    .foregroundColor(Color(UIColor.lightGray))
            }
        }
        .padding()
        .background(Color(UIColor.secondarySystemBackground))
        .cornerRadius(10)
        .padding(.vertical, 2)
    }
}

struct CustomSecureFieldView_Previews: PreviewProvider {
    static var previews: some View {
        CustomSecureFieldView(title: "Password", text: .constant("password"))
    }
}
