//
//  StripePaymentIntentResponse.swift
//  eCommerce
//
//  Created by Imen Ksouri on 13/07/2023.
//

import Foundation

struct StripePaymentIntentResponse: Decodable {
    let customer: String
    let ephemeralKey: String
    let paymentIntent: String
    let publishableKey: String
}
