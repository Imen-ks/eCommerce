//
//  StripePaymentIntentRequest.swift
//  eCommerce
//
//  Created by Imen Ksouri on 13/07/2023.
//

import Foundation

struct StripePaymentIntentRequest: Encodable {
    let customerId: String
    let totalAmount: Double
}
