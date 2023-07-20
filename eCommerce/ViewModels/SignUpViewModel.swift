//
//  SignUpViewModel.swift
//  eCommerce
//
//  Created by Imen Ksouri on 19/06/2023.
//

import Foundation

@MainActor
final class SignUpViewModel: ObservableObject {

    @Published var email = ""
    @Published var password = ""
    @Published var firstName = ""
    @Published var lastName = ""

    private var paymentId: String?
    private let authenticationManager: AuthenticationManager
    private let userManager: UserRepository
    private let paymentManager: PaymentManager

    init(authenticationManager: AuthenticationManager,
         userManager: UserRepository,
         paymentManager: PaymentManager) {
        self.authenticationManager = authenticationManager
        self.userManager = userManager
        self.paymentManager = paymentManager
    }

    func signUp() async throws {
        guard !email.isEmpty, !password.isEmpty else {
            print("No email or password found.")
            return
        }
        
        let user = try await authenticationManager.register(email: email, password: password)
        let stripeCustomerResponse = try await paymentManager.createCustomerPaymentId(
            parameters: StripeCustomerRequest(customerId: user.uid,
                                              fullName: "\(firstName) \(lastName)".capitalized,
                                              email: email.lowercased()))
        
        if let paymentId = stripeCustomerResponse?.customer {
            let profile = Profile(user: user, firstName: firstName, lastName: lastName, paymentId: paymentId)
            try await userManager.createNewUser(user: profile)
            try await userManager.initCart(userId: user.uid)
        }
    }
}
