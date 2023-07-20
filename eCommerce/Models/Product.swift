//
//  Product.swift
//  eCommerce
//
//  Created by Imen Ksouri on 22/06/2023.
//

import Foundation
import SwiftUI

struct Product: Identifiable, Codable, Equatable {
    let id: String
    let name: String
    let price: Double
    let brand: String
    let gender: String
    let category: String
    let subCategory: String
    let description: String
    let sizes: [String]
    let variants: [ProductVariant]
    let isDiscounted: Bool?
    let isNewIn: Bool?

    init(id: String,
         name: String,
         price: Double,
         brand: String,
         gender: String,
         category: String,
         subCategory: String,
         description: String,
         sizes: [String],
         variants: [ProductVariant],
         isDiscounted: Bool? = nil,
         isNewIn: Bool? = nil) {
        self.id = id
        self.name = name
        self.price = price
        self.brand = brand
        self.gender = gender
        self.category = category
        self.subCategory = subCategory
        self.description = description
        self.sizes = sizes
        self.variants = variants
        self.isDiscounted = isDiscounted
        self.isNewIn = isNewIn
    }

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case price
        case brand
        case gender
        case category
        case subCategory
        case description
        case sizes
        case variants
        case isDiscounted
        case isNewIn
    }

    static func ==(lhs: Product, rhs: Product) -> Bool {
        return lhs.id == rhs.id
    }
}

struct ProductVariant: Codable {
    let color: Color
    let colorName: String
    let imageUrl: String

    enum CodingKeys: String, CodingKey {
        case color
        case colorName
        case imageUrl
    }
}


