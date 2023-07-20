//
//  Profile.swift
//  eCommerce
//
//  Created by Imen Ksouri on 18/06/2023.
//

import Foundation
import FirebaseAuth

struct Profile: Codable {
    let uid: String
    let email: String?
    let firstName: String?
    let lastName: String?
    let phoneNumber: String?
    let dateCreated: Date?
    let favoriteProducts: [FavoriteProduct]?
    let cart: Cart?
    let shippingAddress: ShippingAddress?
    let paymentId: String?

    init(user: User,
         firstName: String,
         lastName: String,
         paymentId: String) {
        self.uid = user.uid
        self.email = user.email
        self.firstName = firstName
        self.lastName = lastName
        self.phoneNumber = nil
        self.dateCreated = Date()
        self.favoriteProducts = nil
        self.cart = nil
        self.shippingAddress = nil
        self.paymentId = paymentId
    }
    
    init(uid: String,
         email: String? = nil,
         firstName: String? = nil,
         lastName: String? = nil,
         phoneNumber: String? = nil,
         dateCreated: Date? = nil,
         favoriteProducts: [FavoriteProduct]? = nil,
         cart: Cart? = nil,
         shippingAddress: ShippingAddress? = nil,
         paymentId: String? = nil) {
        self.uid = uid
        self.email = email
        self.firstName = firstName
        self.lastName = lastName
        self.phoneNumber = phoneNumber
        self.dateCreated = dateCreated
        self.favoriteProducts = favoriteProducts
        self.cart = cart
        self.shippingAddress = shippingAddress
        self.paymentId = paymentId
    }

    enum CodingKeys: String, CodingKey {
        case uid
        case email
        case firstName
        case lastName
        case phoneNumber
        case dateCreated
        case favoriteProducts
        case cart
        case shippingAddress
        case paymentId
    }
}
