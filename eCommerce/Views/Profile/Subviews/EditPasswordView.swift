//
//  EditPasswordView.swift
//  eCommerce
//
//  Created by Imen Ksouri on 07/07/2023.
//

import SwiftUI

struct EditPasswordView: View {
    @State private var isChangingPassword = false
    @Binding var password: String
    @Binding var passwordIsChanged: Bool
    @Binding var showError: Bool
    @Binding var error: String
    let action: () -> Void

    var body: some View {
        VStack {
            VStack {
                if !isChangingPassword {
                    Button {
                        isChangingPassword.toggle()
                    } label: {
                        Text("Change password")
                            .font(.custom(AppFont.semiBoldFont, size: 18))
                            .foregroundColor(RCValues.shared
                                .color(forKey: .primary))
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 5)
                    }
                    .buttonStyle(.bordered)
                    .padding(.leading, 40)
                    .tint(RCValues.shared
                        .color(forKey: .primary))
                } else if isChangingPassword && !passwordIsChanged {
                    VStack(alignment: .leading) {
                        Text("New Password")
                            .foregroundColor(.secondary)
                            .padding(.leading, 45)
                        LabeledContent {
                            CustomSecureFieldView(title: "Enter a new password", text: $password)
                                .padding(.leading)
                        } label: {
                            Image(systemName: "key")
                                .foregroundColor(RCValues.shared
                                    .color(forKey: .accent))
                                .frame(width: 20)
                        }
                    }
                    Button {
                        action()
                    } label: {
                        Text("Save")
                            .font(.custom(AppFont.semiBoldFont, size: 18))
                            .foregroundColor(RCValues.shared
                                .color(forKey: .primary))
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 5)
                    }
                    .buttonStyle(.bordered)
                    .padding(.leading, 40)
                    .tint(RCValues.shared
                        .color(forKey: .accent))
                } else if passwordIsChanged {
                    Label {
                        Text("Password has been changed")
                            .font(.custom(AppFont.semiBoldFont, size: 18))
                            .foregroundColor(RCValues.shared
                                .color(forKey: .primary))
                            .frame(maxWidth: .infinity, alignment: .leading)
                    } icon: {
                        Image(systemName: "checkmark")
                            .foregroundColor(.green)
                    }
                    .padding(.leading, 40)
                }
            }
            .padding(.horizontal)
            .alert(isPresented: $showError) {
                Alert(title: Text("Password Update Error"), message: Text(error), dismissButton: .default(Text("Ok")))
            }
            .padding(.vertical, 10)
            Divider()
        }
    }
}

struct EditPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            EditPasswordView(password: .constant("janedoe"),
                             passwordIsChanged: .constant(false),
                             showError: .constant(false),
                             error: .constant("")) {}
        }
    }
}
