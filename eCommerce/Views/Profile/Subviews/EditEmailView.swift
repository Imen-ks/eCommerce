//
//  EditEmailView.swift
//  eCommerce
//
//  Created by Imen Ksouri on 08/07/2023.
//

import SwiftUI

struct EditEmailView: View {
    @Binding var updateRequestType: UpdateRequestType
    @Binding var currentPassword: String
    @Binding var newEmail: String
    @Binding var emailUpdateIsRequested: Bool
    @Binding var emailIsUpdated: Bool
    @Binding var showError: Bool
    @Binding var error: String
    let action: () -> Void

    var body: some View {
        VStack {
            if updateRequestType != .email {
                Button {
                    updateRequestType = .email
                } label: {
                    Text("Change email")
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
            } else if updateRequestType == .email {
                if !emailUpdateIsRequested {
                    VStack(alignment: .leading) {
                        Text("New Email")
                            .foregroundColor(.secondary)
                            .padding(.leading, 45)
                        LabeledContent {
                            CustomTextFieldView(title: "Enter a new valid email", text: $newEmail)
                                .padding(.leading)
                        } label: {
                            Image(systemName: "envelope")
                                .foregroundColor(
                                    RCValues.shared.color(forKey: .accent)
                                )
                                .frame(width: 20)
                        }
                        LabeledContent {
                            CustomSecureFieldView(title: "Enter your current password", text: $currentPassword)
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
                        if !newEmail.isValidEmail() {
                            let message = "Please enter a valid email"
                            showError(with: message)
                        } else if currentPassword.count < 6 {
                            let message = "Password must be at least 6 characters long"
                            showError(with: message)
                            currentPassword = ""
                        }  else {
                            action()
                        }
                    } label: {
                        Text("Request update")
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
                        Group {
                            if emailUpdateIsRequested && !emailIsUpdated {
                                Text("Request sent to \(newEmail).\nClick on the link received to proceed with update.")
                            } else if emailIsUpdated {
                                Text("Email has been changed")
                            }
                        }
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
    private func showError(with message: String) {
        if error == message { showError = true }
        else { error = message }
    }
}

struct EditEmailView_Previews: PreviewProvider {
    static var previews: some View {
        EditEmailView(
            updateRequestType: .constant(.none),
            currentPassword: .constant("janedoe"),
            newEmail: .constant("jane@doe.com"),
            emailUpdateIsRequested: .constant(false),
            emailIsUpdated: .constant(false),
            showError: .constant(false),
            error: .constant("")
        ) {}
    }
}
