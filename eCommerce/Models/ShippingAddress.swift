//
//  ShippingAddress.swift
//  eCommerce
//
//  Created by Imen Ksouri on 07/07/2023.
//

import Foundation

struct ShippingAddress: Codable {
    let id: String
    let streetNumber: String
    let streetName: String
    let postalCode: String
    let town: String
    let country: String

    enum CodingKeys: String, CodingKey {
        case id
        case streetNumber
        case streetName
        case postalCode
        case town
        case country
    }
}
