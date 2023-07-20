//
//  SignInViewModel.swift
//  eCommerce
//
//  Created by Imen Ksouri on 19/06/2023.
//

import Foundation

@MainActor
final class SignInViewModel: ObservableObject {

    @Published var email = ""
    @Published var password = ""

    private let authenticationManager: AuthenticationManager

    init(authenticationManager: AuthenticationManager) {
        self.authenticationManager = authenticationManager
    }

    func signIn() async throws {
        guard !email.isEmpty, !password.isEmpty else {
            return
        }
        
        try await authenticationManager.signIn(email: email, password: password)
    }

    func resetPassword() async throws {
        try await authenticationManager.resetPassword(email: email)
    }
}
