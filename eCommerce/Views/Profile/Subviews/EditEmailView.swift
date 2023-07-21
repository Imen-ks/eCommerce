//
//  EditEmailView.swift
//  eCommerce
//
//  Created by Imen Ksouri on 08/07/2023.
//

import SwiftUI

struct EditEmailView: View {
    @State private var isChangingEmail = false
    @Binding var email: String
    @Binding var emailIsChanged: Bool
    @Binding var showError: Bool
    @Binding var error: String
    let action: () -> Void

    var body: some View {
        VStack {
            VStack {
                if !isChangingEmail {
                    Button {
                        isChangingEmail.toggle()
                    } label: {
                        Text("Change email")
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
                } else if isChangingEmail && !emailIsChanged {
                    VStack(alignment: .leading) {
                        Text("New Email")
                            .foregroundColor(.secondary)
                            .padding(.leading, 45)
                        LabeledContent {
                            CustomTextFieldView(title: "Enter a new email", text: $email)
                                .padding(.leading)
                        } label: {
                            Image(systemName: "envelope")
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
                } else if emailIsChanged {
                    Label {
                        Text("Email has been changed")
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
                Alert(title: Text("Email Update Error"), message: Text(error), dismissButton: .default(Text("Ok")))
            }
            .padding(.vertical, 10)
            Divider()
        }
    }
}

struct EditEmailView_Previews: PreviewProvider {
    static var previews: some View {
        EditEmailView(email: .constant("jane@doe.com"),
                      emailIsChanged: .constant(false),
                      showError: .constant(false),
                      error: .constant("")) {}
    }
}
