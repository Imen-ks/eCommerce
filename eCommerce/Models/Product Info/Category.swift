//
//  Category.swift
//  eCommerce
//
//  Created by Imen Ksouri on 26/06/2023.
//

import Foundation

enum MasterCategory: String, CaseIterable {
    case clothes = "Clothing"
    case shoes = "Shoes"
    case accessories = "Accessories"
}

enum SubCategory: String, CaseIterable {
    case dresses = "Dresses"
    case tshirts = "T-Shirts"
    case shirts = "Shirts"
    case sweatshirts = "Sweatshirts"
    case trousers = "Trousers"
    case jeans = "Jeans"
    case shorts = "Shorts"
    case skirts = "Skirts"
    case jackets = "Jackets"
    case coats = "Coats"
    case trainers = "Trainers"
    case sandals = "Sandals"
    case pumps = "Pumps"
    case boots = "Boots"
    case ballerinas = "Ballerinas"
    case bags = "Bags"
    case sunglasses = "Sunglasses"
    case watches = "Watches"
    case belts = "Belts"

    var masterCategory: MasterCategory {
        switch self {
        case .dresses: return .clothes
        case .tshirts: return .clothes
        case .shirts: return .clothes
        case .sweatshirts: return .clothes
        case .trousers: return .clothes
        case .jeans: return .clothes
        case .shorts: return .clothes
        case .skirts: return .clothes
        case .jackets: return .clothes
        case .coats: return .clothes
        case .trainers: return .shoes
        case .sandals: return .shoes
        case .pumps: return .shoes
        case .boots: return .shoes
        case .ballerinas: return .shoes
        case .bags: return .accessories
        case .sunglasses: return .accessories
        case .watches: return .accessories
        case .belts: return .accessories
        }
    }
}
