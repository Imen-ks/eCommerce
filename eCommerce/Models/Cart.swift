//
//  Cart.swift
//  eCommerce
//
//  Created by Imen Ksouri on 03/07/2023.
//

import Foundation

struct Cart: Identifiable, Codable {
    let id: String
    let cartItems: [CartItem]?
    let freightCosts: Double
    let discountAmount: Double
    let totalAmount: Double

    init(id: String,
         cartItems: [CartItem]? = nil,
         freightCosts: Double = 0,
         discountAmount: Double = 0,
         totalAmount: Double = 0) {
        self.id = id
        self.cartItems = cartItems
        self.freightCosts = freightCosts
        self.discountAmount = discountAmount
        self.totalAmount = totalAmount
    }

    enum CodingKeys: String, CodingKey {
        case id
        case cartItems
        case freightCosts
        case discountAmount
        case totalAmount
    }
}
