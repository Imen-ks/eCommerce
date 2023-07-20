//
//  UserManager+Cart.swift
//  eCommerce
//
//  Created by Imen Ksouri on 19/07/2023.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift
import Combine

extension UserManager: CartRepository {
    internal func userCartCollection(userId: String) -> CollectionReference {
        userDocument(userId: userId).collection("cart")
    }

    internal func userCartDocument(userId: String) -> DocumentReference {
        userCartCollection(userId: userId).document(userId)
    }

    func addListenerForCart(userId: String) -> AnyPublisher<[Cart], Error> {
        let (publisher, listener) = userCartCollection(userId: userId)
            .addSnapshotListener(as: Cart.self)
        self.userCartListener = listener
        return publisher
    }

    internal func userCartItemsCollection(userId: String) -> CollectionReference {
        userCartDocument(userId: userId).collection("cart_items")
    }

    func addListenerForCartItems(userId: String) -> AnyPublisher<[CartItem], Error> {
        let (publisher, listener) = userCartItemsCollection(userId: userId)
            .addSnapshotListener(as: CartItem.self)
        self.userCartItemsListener = listener
        return publisher
    }

    func addToCart(userId: String, item: CartItem) async throws {
        try userCartItemsCollection(userId: userId).document(item.id).setData(from: item, merge: false)
        let cartData: [String:Any] = [
            Cart.CodingKeys.discountAmount.rawValue : FieldValue.increment(item.price * item.discountPercent / 100),
            Cart.CodingKeys.totalAmount.rawValue : FieldValue.increment(item.price * (1 - item.discountPercent / 100))
        ]
        try await userCartDocument(userId: userId).updateData(cartData)
    }

    func removeFromCart(userId: String, item: CartItem) async throws {
        try await userCartItemsCollection(userId: userId).document(item.id).delete()
        let data: [String:Any] = [
            Cart.CodingKeys.discountAmount.rawValue : FieldValue.increment(-Double(item.quantity) * (item.price * item.discountPercent / 100)),
            Cart.CodingKeys.totalAmount.rawValue : FieldValue.increment(-Double(item.quantity) * (item.price * (1 - item.discountPercent / 100)))
        ]
        try await userCartDocument(userId: userId).updateData(data)
    }

    func increaseCartItemQuantity(userId: String, item: CartItem, newQuantity: Int) async throws {
        let document = userCartItemsCollection(userId: userId).document(item.id)
        let itemData: [String:Any] = [
            CartItem.CodingKeys.quantity.rawValue : newQuantity
        ]
        try await document.updateData(itemData)
        let data: [String:Any] = [
            Cart.CodingKeys.discountAmount.rawValue : FieldValue.increment(item.price * item.discountPercent / 100),
            Cart.CodingKeys.totalAmount.rawValue : FieldValue.increment(item.price * (1 - item.discountPercent / 100))
        ]
        try await userCartDocument(userId: userId).updateData(data)
    }

    func decreaseCartItemQuantity(userId: String, item: CartItem, newQuantity: Int) async throws {
        if newQuantity > 0 {
            let document = userCartItemsCollection(userId: userId).document(item.id)
            let itemData: [String:Any] = [
                CartItem.CodingKeys.quantity.rawValue : newQuantity
            ]
            try await document.updateData(itemData)
            let data: [String:Any] = [
                Cart.CodingKeys.discountAmount.rawValue : FieldValue.increment(-item.price * item.discountPercent / 100),
                Cart.CodingKeys.totalAmount.rawValue : FieldValue.increment(-item.price * (1 - item.discountPercent / 100))
            ]
            try await userCartDocument(userId: userId).updateData(data)
        } else {
            try await removeFromCart(userId: userId, item: item)
        }
    }

    func clearCart(userId: String, cartItems: [CartItem]) async throws {
        for item in cartItems {
            try await removeFromCart(userId: userId, item: item)
        }
    }
}
