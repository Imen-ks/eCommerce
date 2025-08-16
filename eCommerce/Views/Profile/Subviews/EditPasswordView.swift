//
//  EditPasswordView.swift
//  eCommerce
//
//  Created by Imen Ksouri on 07/07/2023.
//

import SwiftUI

struct EditPasswordView: View {
    @Binding var updateRequestType: UpdateRequestType
    @Binding var password: String
    @Binding var passwordIsUpdated: Bool
    @Binding var showError: Bool
    @Binding var error: String
    let action: () -> Void

    var body: some View {
        VStack {
            if updateRequestType != .password {
                Button {
                    updateRequestType = .password
                } label: {
                    Text("Change password")
                        .font(.custom(AppFont.semiBoldFont, size: 18))
                        .foregroundColor(
                            RCValues.shared.color(forKey: .primary)
                        )
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 5)
                }
                .buttonStyle(.bordered)
                .padding(.leading, 40)
                .tint(
                    RCValues.shared.color(forKey: .primary)
                )
            } else if updateRequestType == .password {
                if !passwordIsUpdated {
                    VStack(alignment: .leading) {
                        Text("New Password")
                            .foregroundColor(.secondary)
                            .padding(.leading, 45)
                        LabeledContent {
                            CustomSecureFieldView(title: "Enter a new password", text: $password)
                                .padding(.leading)
                        } label: {
                            Image(systemName: "key")
                                .foregroundColor(
                                    RCValues.shared.color(forKey: .accent)
                                )
                                .frame(width: 20)
                        }
                    }
                    Button {
                        action()
                    } label: {
                        Text("Save")
                            .font(.custom(AppFont.semiBoldFont, size: 18))
                            .foregroundColor(
                                RCValues.shared.color(forKey: .primary)
                            )
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 5)
                    }
                    .buttonStyle(.bordered)
                    .padding(.leading, 40)
                    .tint(
                        RCValues.shared.color(forKey: .accent)
                    )
                } else {
                    Label {
                        Text("Password has been changed")
                            .font(.custom(AppFont.semiBoldFont, size: 18))
                            .foregroundColor(
                                RCValues.shared.color(forKey: .primary)
                            )
                            .frame(maxWidth: .infinity, alignment: .leading)
                    } icon: {
                        Image(systemName: "checkmark")
                            .foregroundColor(.green)
                    }
                    .padding(.leading, 40)
                }
            }
        }
        .padding(.horizontal)
        .padding(.vertical, 10)
        Divider()
    }
}

struct EditPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            EditPasswordView(
                updateRequestType: .constant(.none),
                password: .constant("janedoe"),
                passwordIsUpdated: .constant(false),
                showError: .constant(false),
                error: .constant("")
            ) {}
        }
    }
}
