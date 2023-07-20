//
//  Discount.swift
//  eCommerce
//
//  Created by Imen Ksouri on 26/06/2023.
//

import Foundation

struct Discount: Identifiable, Codable {
    let id: String
    let discountPercent: Double

    enum CodingKeys: CodingKey {
        case id
        case discountPercent
    }
}
