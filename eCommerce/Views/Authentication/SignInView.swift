//
//  SignInView.swift
//  eCommerce
//
//  Created by Imen Ksouri on 18/06/2023.
//

import SwiftUI
import FirebaseAnalytics

struct SignInView: View {
    @State private var showPassword = false
    @State private var showError = false
    @State private var error = ""
    @State private var showResetPassword = false
    @State private var settingsDetent = PresentationDetent.medium
    @Binding var showAuthentication: Bool
    var authenticationManager: AuthenticationManager
    var userManager: UserRepository
    var paymentManager: PaymentManager
    @StateObject private var viewModel: SignInViewModel

    init(showAuthentication: Binding<Bool>,
         authenticationManager: AuthenticationManager,
         userManager: UserRepository,
         paymentManager: PaymentManager) {
        self._showAuthentication = showAuthentication
        self.authenticationManager = authenticationManager
        self.userManager = userManager
        self.paymentManager = paymentManager
        self._viewModel = .init(wrappedValue: SignInViewModel(authenticationManager: authenticationManager))
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                BackgroundView()
                VStack {
                    Spacer()
                    CustomTextFieldView(title: "Email", text: $viewModel.email)
                    CustomSecureFieldView(title: "Password", text: $viewModel.password)
                    ButtonView(text: "Sign In", backgroundColor: .black, foregroundColor: .white) {
                        Task {
                            do {
                                try await viewModel.signIn()
                                guard !viewModel.email.isEmpty, !viewModel.password.isEmpty else {
                                    self.error = "No email or password found."
                                    return
                                }
                                showAuthentication = false
                                FirebaseAnalytics.Analytics.logEvent(AnalyticsEventLogin, parameters: nil)
                            } catch let(error) {
                                self.error = error.localizedDescription
                            }
                        }
                    }
                    .alert(isPresented: $showError) {
                        Alert(title: Text("Login Error"), message: Text(error), dismissButton: .default(Text("Ok")))
                    }
                    .onChange(of: error) { newValue in
                        guard !newValue.isEmpty else {
                            return
                        }
                        showError = true
                    }
                    Button {
                        withAnimation {
                            showResetPassword.toggle()
                        }
                    } label: {
                        Text("Forgot password ?")
                            .font(.custom(AppFont.regularFont, size: 18))
                            .foregroundColor(RCValues.shared
                                .color(forKey: .secondary))
                    }
                    .buttonStyle(.bordered)
                    .tint(RCValues.shared
                        .color(forKey: .primary))
                    .sheet(isPresented: $showResetPassword) {
                        ResetPasswordView(showResetPassword: $showResetPassword,
                                          authenticationManager: authenticationManager)
                        .presentationDetents(
                            [.medium],
                            selection: $settingsDetent
                        )
                    }
                    Spacer()
                    LogoView()
                    HStack {
                        Text("Don't have an account ?")
                            .font(.custom(AppFont.regularFont, size: 18))
                            .foregroundColor(RCValues.shared
                                .color(forKey: .primary))
                        NavigationLink {
                            SignUpView(showAuthentication: $showAuthentication,
                                       authenticationManager: authenticationManager,
                                       userManager: userManager,
                                       paymentManager: PaymentManager())
                        } label: {
                            Text("Sign Up")
                                .font(.custom(AppFont.boldFont, size: 20))
                                .foregroundColor(RCValues.shared
                                    .color(forKey: .primary))
                                .underline()
                        }
                    }
                    Spacer()
                }
                .padding()
            }
            .navigationBarBackButtonHidden(true)
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            SignInView(showAuthentication: .constant(false),
                       authenticationManager: AuthenticationManager(),
                       userManager: UserManager(),
                       paymentManager: PaymentManager())
        }
    }
}
