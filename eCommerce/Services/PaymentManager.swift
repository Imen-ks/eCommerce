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

    func createCustomerPaymentId(parameters: Encodable) async throws -> StripeCustomerResponse?{
        let api = BackendApi(endpoint: .customers,
                             parameters: parameters)
        return try await BackendApiCaller.shared.load(
            api: api, response: StripeCustomerResponse.self)
    }

    func preparePaymentSheet(parameters: Encodable) async throws -> PaymentSheet? {
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
