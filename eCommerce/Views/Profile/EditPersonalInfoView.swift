//
//  EditPersonalInfoView.swift
//  eCommerce
//
//  Created by Imen Ksouri on 07/07/2023.
//

import SwiftUI

struct EditPersonalInfoView: View {
    @Environment(\.scenePhase) private var scenePhase
    @Binding var isEditingPersonalInfo: Bool
    @Binding var showError: Bool
    @State private var fields: [(icon: String, label: String, value: Binding<String>)] = []
    @State private var updateRequestType: UpdateRequestType = .none
    @State private var isShowingDeleteAccount = false
    @ObservedObject var viewModel: ProfileViewModel

    var body: some View {
        ScrollView(showsIndicators: false) {
            Spacer()
            ForEach(fields, id: \.self.1.description) { field in
                VStack(alignment: .leading) {
                    Text(field.label)
                        .foregroundColor(.secondary)
                        .padding(.leading, 45)
                    LabeledContent {
                        HStack {
                            TextField("", text: field.value)
                                .foregroundColor(
                                    RCValues.shared.color(forKey: .primary)
                                )
                                .padding(.leading)
                        }
                    } label: {
                        Image(systemName: field.icon)
                            .foregroundColor(
                                RCValues.shared.color(forKey: .accent)
                            )
                            .frame(width: 20)
                    }
                }
                .padding(.horizontal)
                .onChange(of: field.value.wrappedValue) { newValue in
                    viewModel.updateUserInfo()
                    viewModel.getProfile()
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
                        Text(viewModel.getUserAuthEmail())
                            .foregroundColor(.secondary)
                            .padding(.leading)
                        Spacer()
                    }
                } label: {
                    Image(systemName: "envelope")
                        .foregroundColor(
                            RCValues.shared.color(forKey: .accent)
                        )
                        .frame(width: 20)
                }
            }
            .padding(.horizontal)
            .padding(.bottom, 10)
            Divider()
            EditEmailView(
                updateRequestType: $updateRequestType,
                currentPassword: $viewModel.currentPassword,
                newEmail: $viewModel.newEmail,
                emailUpdateIsRequested: $viewModel.emailUpdateIsRequested,
                emailIsUpdated: $viewModel.emailIsUpdated,
                showError: $showError,
                error: $viewModel.error
            ) {
                if viewModel.getUserAuthEmail() != viewModel.newEmail {
                    viewModel.sendUpdateLink()
                } else {
                    viewModel.error = "Email is the same as current email"
                    viewModel.currentPassword = ""
                }
            }
            
            EditPasswordView(
                updateRequestType: $updateRequestType,
                password: $viewModel.newPassword,
                passwordIsUpdated: $viewModel.passwordIsUpdated,
                showError: $showError,
                error: $viewModel.error
            ) {
                viewModel.updatePassword()
            }
            SignOutButtonView {
                viewModel.signOut()
                viewModel.userIsUnauthorized = true
            }
            .padding(.bottom, 10)
            DeleteAccountSectionView { isShowingDeleteAccount.toggle() }
            .navigationDestination(isPresented: $isShowingDeleteAccount) {
                DeleteAccountView(
                    isShowingDeleteAccount: $isShowingDeleteAccount
                ) {
                    viewModel.deleteAccount()
                }
            }
        }
        .padding(.horizontal)
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
        .onAppear {
            self.fields = [
                (icon: "person", label: "First Name", value: $viewModel.firstName),
                (icon: "person", label: "Last Name", value: $viewModel.lastName),
                (icon: "phone", label: "Phone Number", value: $viewModel.phoneNumber)
            ]
        }
        .onChange(of: scenePhase) { newPhase in
            if newPhase == .active, viewModel.emailUpdateIsRequested {
                viewModel.reloadUser()
            }
        }
    }
}

struct EditPersonalInfoView_Previews: PreviewProvider {
    static var user = AuthenticationManager().user
    static var previews: some View {
        EditPersonalInfoView(
            isEditingPersonalInfo: .constant(false),
            showError: .constant(false),
            viewModel: ProfileViewModel(
                authenticationManager: AuthenticationManager(),
                userManager: UserManager())
        )
    }
}

enum UpdateRequestType {
    case email
    case password
    case none
}
