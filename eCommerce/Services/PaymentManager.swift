//
//  PaymentManager.swift
//  eCommerce
//
//  Created by Imen Ksouri on 13/07/2023.
//

import Foundation
import StripePaymentSheet

final class PaymentManager {

    let merchantDisplayName = "Shopping App"

    func createCustomerPaymentId(userId: String, fullName: String, email: String) async throws -> StripeCustomerResponse? {
        let parameters = StripeCustomerRequest(
            customerId: userId,
            fullName: fullName,
            email: email)
        let api = BackendApi(endpoint: .customers,
                             parameters: parameters)
        return try await BackendApiCaller.shared.load(
            api: api, response: StripeCustomerResponse.self)
    }

    func preparePaymentSheet(profile: Profile?, cart: Cart?) async throws -> PaymentSheet? {
        guard let profile,
              let cart,
              let paymentId = profile.paymentId else { return nil }
        let parameters = StripePaymentIntentRequest(
          customerId: paymentId,
          totalAmount: cart.totalAmount)
        let api = BackendApi(endpoint: .checkout, parameters: parameters)
        
        guard let paymentIntentResponse = try await BackendApiCaller.shared.load(
            api: api, response: StripePaymentIntentResponse.self) else {
            return nil
        }

        STPAPIClient.shared.publishableKey = paymentIntentResponse.publishableKey

        var configuration = PaymentSheet.Configuration()
        configuration.merchantDisplayName = self.merchantDisplayName
        configuration.customer = .init(id: paymentIntentResponse.customer, ephemeralKeySecret: paymentIntentResponse.ephemeralKey)

        return PaymentSheet(paymentIntentClientSecret: paymentIntentResponse.paymentIntent, configuration: configuration)
    }
}
