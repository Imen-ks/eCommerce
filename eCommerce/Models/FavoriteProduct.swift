//
//  FavoriteProduct.swift
//  eCommerce
//
//  Created by Imen Ksouri on 26/06/2023.
//

import Foundation

struct FavoriteProduct: Identifiable, Codable, Equatable {
    let id: String
    
    enum CodingKeys: String, CodingKey {
        case id
    }
}
