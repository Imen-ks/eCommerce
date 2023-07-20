//
//  CartRepository.swift
//  eCommerce
//
//  Created by Imen Ksouri on 19/07/2023.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift
import Combine

protocol CartRepository {
    func userCartCollection(userId: String) -> CollectionReference

    func userCartDocument(userId: String) -> DocumentReference

    func addListenerForCart(userId: String) -> AnyPublisher<[Cart], Error>

    func userCartItemsCollection(userId: String) -> CollectionReference

    func addListenerForCartItems(userId: String) -> AnyPublisher<[CartItem], Error>

    func addToCart(userId: String, item: CartItem) async throws

    func removeFromCart(userId: String, item: CartItem) async throws

    func increaseCartItemQuantity(userId: String, item: CartItem, newQuantity: Int) async throws

    func decreaseCartItemQuantity(userId: String, item: CartItem, newQuantity: Int) async throws

    func clearCart(userId: String, cartItems: [CartItem]) async throws
}
