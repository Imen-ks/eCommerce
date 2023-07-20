//
//  OrderItem.swift
//  eCommerce
//
//  Created by Imen Ksouri on 11/07/2023.
//

import Foundation

struct OrderItem: Identifiable, Codable {
    let id: String
    let orderId: String
    let name: String
    let brand: String
    let size: String
    let price: Double
    let quantity: Int
    let colorName: String
    let imageUrl: String

    enum CodingKeys: String, CodingKey {
        case id
        case orderId
        case name
        case brand
        case size
        case price
        case quantity
        case colorName
        case imageUrl
    }
}
