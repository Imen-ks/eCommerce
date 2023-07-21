//
//  SignUpView.swift
//  eCommerce
//
//  Created by Imen Ksouri on 18/06/2023.
//

import SwiftUI
import FirebaseAnalytics

struct SignUpView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var showPassword = false
    @State private var showError = false
    @State private var error = ""
    @State private var isLoading = false
    @Binding var showAuthentication: Bool
    var authenticationManager: AuthenticationManager
    var userManager: UserRepository
    var paymentManager: PaymentManager
    @StateObject private var viewModel: SignUpViewModel

    init(showAuthentication: Binding<Bool>,
         authenticationManager: AuthenticationManager,
         userManager: UserRepository,
         paymentManager: PaymentManager) {
        self._showAuthentication = showAuthentication
        self.authenticationManager = authenticationManager
        self.userManager = userManager
        self.paymentManager = paymentManager
        self._viewModel = .init(wrappedValue: SignUpViewModel(authenticationManager: authenticationManager, userManager: userManager, paymentManager: paymentManager))
    }

    var body: some View {
        ZStack {
            BackgroundView()
            VStack {
                LogoView()
                CustomTextFieldView(title: "First name", text: $viewModel.firstName)
                CustomTextFieldView(title: "Last name", text: $viewModel.lastName)
                CustomTextFieldView(title: "Email", text: $viewModel.email)
                CustomSecureFieldView(title: "Password", text: $viewModel.password)
                ButtonView(text: isLoading ? "Loading..." : "Sign Up",
                           backgroundColor: isLoading ? .gray : .black,
                           foregroundColor: .white) {
                    Task {
                        do {
                            FirebaseAnalytics.Analytics.logEvent(AnalyticsEventSignUp, parameters: nil)
                            isLoading = true
                            try await viewModel.signUp()
                            showAuthentication = false
                            isLoading = false
                        } catch let(error) {
                            isLoading = false
                            self.error = error.localizedDescription
                        }
                    }
                }
                .disabled(isLoading)
                .alert(isPresented: $showError) {
                    Alert(title: Text("Registration Error"), message: Text(error), dismissButton: .default(Text("Ok")))
                }
                .onChange(of: error) { newValue in
                    guard !newValue.isEmpty else {
                        return
                    }
                    showError = true
                }
                if isLoading {
                    ProgressView()
                        .padding(.bottom)
                }
                HStack {
                    Text("Already have an account ?")
                        .font(.custom(AppFont.regularFont, size: 18))
                        .foregroundColor(RCValues.shared
                            .color(forKey: .primary))
                    Button {
                        dismiss()
                    } label: {
                        Text("Sign In")
                            .font(.custom(AppFont.boldFont, size: 20))
                            .foregroundColor(isLoading ? .gray : RCValues.shared
                                .color(forKey: .primary))
                            .underline()
                    }
                    .disabled(isLoading)
                }
                Spacer()
            }
            .padding()
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            SignUpView(showAuthentication: .constant(false),
                       authenticationManager: AuthenticationManager(),
                       userManager: UserManager(),
                       paymentManager: PaymentManager())
        }
    }
}
