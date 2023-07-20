//
//  Order.swift
//  eCommerce
//
//  Created by Imen Ksouri on 03/07/2023.
//

import Foundation

struct Order: Identifiable, Codable {
    let id: String
    let userId: String
    let orderItems: [OrderItem]?
    let freightCosts: Double
    let discountAmount: Double
    let totalAmount: Double
    let numberOfArticles: Int
    let shippingAddress: ShippingAddress?
    let dateCreated: Date

    enum CodingKeys: String, CodingKey {
        case id
        case userId
        case orderItems
        case freightCosts
        case discountAmount
        case totalAmount
        case numberOfArticles
        case shippingAddress
        case dateCreated
    }

    init(id: String,
         userId: String,
         orderItems: [OrderItem]? = nil,
         freightCosts: Double,
         discountAmount: Double,
         totalAmount: Double,
         numberOfArticles: Int,
         shippingAddress: ShippingAddress? = nil,
         dateCreated: Date) {
        self.id = id
        self.userId = userId
        self.orderItems = orderItems
        self.freightCosts = freightCosts
        self.discountAmount = discountAmount
        self.totalAmount = totalAmount
        self.numberOfArticles = numberOfArticles
        self.shippingAddress = shippingAddress
        self.dateCreated = dateCreated
    }

    static func ==(lhs: Order, rhs: Order) -> Bool {
        return lhs.id == rhs.id
    }
}
