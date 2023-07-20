//
//  StripeCustomerRequest.swift
//  eCommerce
//
//  Created by Imen Ksouri on 13/07/2023.
//

import Foundation

struct StripeCustomerRequest: Encodable {
    let customerId: String
    let fullName: String
    let email: String
}
