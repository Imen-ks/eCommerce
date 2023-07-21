//
//  EditPersonalInfoView.swift
//  eCommerce
//
//  Created by Imen Ksouri on 07/07/2023.
//

import SwiftUI

struct EditPersonalInfoView: View {
    var fields: [(icon: String, label: String, value: Binding<String>)]
    var currentEmail: String?
    @Binding var isEditingPersonalInfo: Bool
    @Binding var newPassword: String
    @Binding var passwordIsChanged: Bool
    @Binding var newEmail: String
    @Binding var emailIsChanged: Bool
    @Binding var showError: Bool
    @Binding var error: String
    @State private var isShowingDeleteAccount = false
    let savePersonalInfoAction: () -> Void
    let changeEmailAction: () -> Void
    let changePasswordAction: () -> Void
    let signOutAction: () -> Void
    let deleteAccountAction: () -> Void

    var body: some View {
        ScrollView {
            Spacer()
            ForEach(fields, id: \.self.1.description) { field in
                VStack(alignment: .leading) {
                    Text(field.label)
                        .foregroundColor(.secondary)
                        .padding(.leading, 45)
                    LabeledContent {
                        HStack {
                            TextField("", text: field.value)
                                .foregroundColor(RCValues.shared
                                    .color(forKey: .primary))
                                .padding(.leading)
                        }
                    } label: {
                        Image(systemName: field.icon)
                            .foregroundColor(RCValues.shared
                                .color(forKey: .accent))
                            .frame(width: 20)
                    }
                }
                .padding(.horizontal)
                .onChange(of: field.value.wrappedValue) { newValue in
                    savePersonalInfoAction()
                }
                Divider()
                    .padding(.vertical, 10)
            }
            VStack(alignment: .leading) {
                Text("Email")
                    .foregroundColor(.secondary)
                    .padding(.leading, 45)
                LabeledContent {
                    HStack {
                        Text(currentEmail ?? "")
                            .foregroundColor(.secondary)
                            .padding(.leading)
                        Spacer()
                    }
                } label: {
                    Image(systemName: "envelope")
                        .foregroundColor(RCValues.shared
                            .color(forKey: .accent))
                        .frame(width: 20)
                }
            }
            .padding(.horizontal)
            .padding(.bottom, 10)
            Divider()
            EditEmailView(email: $newEmail,
                          emailIsChanged: $emailIsChanged,
                          showError: $showError,
                          error: $error) { changeEmailAction() }
            
            EditPasswordView(password: $newPassword,
                             passwordIsChanged: $passwordIsChanged,
                             showError: $showError,
                             error: $error) { changePasswordAction() }
            SignOutButtonView {
                signOutAction()
            }
            .padding(.bottom, 10)
            DeleteAccountSectionView {
                isShowingDeleteAccount.toggle()
            }
            .navigationDestination(isPresented: $isShowingDeleteAccount) {
                DeleteAccountView(isShowingDeleteAccount: $isShowingDeleteAccount) {
                    deleteAccountAction()
                }
            }
        }
        .padding(.horizontal)
        .onDisappear {
            emailIsChanged = false
            passwordIsChanged = false
            newEmail = ""
            newPassword = ""
        }
        .navigationTitle("Personal Information")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    isEditingPersonalInfo.toggle()
                } label: {
                    Image(systemName: "chevron.left")
                }
            }
        }
    }
}

struct EditPersonalInfoView_Previews: PreviewProvider {
    static var user = AuthenticationManager().user
    static var previews: some View {
        EditPersonalInfoView(fields:
                                [
                                    (icon: "person", label: "First Name", value: .constant("Jane")),
                                    (icon: "person", label: "Last Name", value: .constant("Doe")),
                                    (icon: "phone", label: "Phone Number", value: .constant("555-555-555"))
                                ],
                             currentEmail: "jane@doe.com",
                             isEditingPersonalInfo: .constant(false),
                             newPassword: .constant("janedoe"),
                             passwordIsChanged: .constant(false),
                             newEmail: .constant("jane@doe.com"),
                             emailIsChanged: .constant(false),
                             showError: .constant(false),
                             error: .constant("")) {
        } changeEmailAction: {
        } changePasswordAction: {
        } signOutAction: {
        } deleteAccountAction: {}
    }
}
