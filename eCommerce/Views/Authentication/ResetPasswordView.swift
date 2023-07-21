//
//  ResetPasswordView.swift
//  eCommerce
//
//  Created by Imen Ksouri on 19/06/2023.
//

import SwiftUI

struct ResetPasswordView: View {
    @Binding var showResetPassword: Bool
    var authenticationManager: AuthenticationManager
    @StateObject private var viewModel: SignInViewModel

    init(showResetPassword: Binding<Bool>,
         authenticationManager: AuthenticationManager) {
        self._showResetPassword = showResetPassword
        self.authenticationManager = authenticationManager
        self._viewModel = .init(wrappedValue: SignInViewModel(authenticationManager: authenticationManager))
    }

    var body: some View {
        ZStack {
            BackgroundView()
            VStack {
                Text("Submit your email address. If a user exists, you will receive a link to reset your password.")
                    .font(.custom(AppFont.regularFont, size: 16))
                    .padding(.vertical, 20)
                    .padding(.horizontal, 20)
                    .background(.white)
                    .foregroundColor(RCValues.shared
                        .color(forKey: .primary))
                    .cornerRadius(10)
                CustomTextFieldView(title: "Email", text: $viewModel.email)
                Spacer()
                ButtonView(text: "Submit", backgroundColor: .black, foregroundColor: .white) {
                    Task {
                        do {
                            try await viewModel.resetPassword()
                        } catch {
                            print(error)
                        }
                        showResetPassword.toggle()
                    }
                }
                .padding(.vertical, -20)
                ButtonView(text: "Cancel", backgroundColor: .secondary, foregroundColor: .white) {
                    showResetPassword.toggle()
                }
            }
            .padding()
            .padding(.top, 30)
        }
    }
}

struct ResetPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ResetPasswordView(showResetPassword: .constant(false),
                          authenticationManager: AuthenticationManager())
    }
}
