//
//  UserRepository.swift
//  eCommerce
//
//  Created by Imen Ksouri on 19/07/2023.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift
import Combine

protocol UserRepository {
    var userCollection: CollectionReference { get }

    var userFavoriteProductsListener: ListenerRegistration? { get set }

    var userCartListener: ListenerRegistration? { get set }

    var userCartItemsListener: ListenerRegistration? { get set}

    var userShippingAddressListener: ListenerRegistration? { get set }

    var userOrdersListener: ListenerRegistration? { get set }

    func userDocument(userId: String) -> DocumentReference

    func userShippingAddressCollection(userId: String) -> CollectionReference

    func userShippingAddressDocument(userId: String) -> DocumentReference

    func createNewUser(user: Profile) async throws

    func updateUserInfo(userId: String,
                        firstName: String,
                        lastName: String,
                        phoneNumber: String) async throws

    func updateUserEmail(userId: String, email: String) async throws

    func initCart(userId: String) async throws

    func getUserProfile(userId: String) async throws -> Profile

    func addListenerForShippingAddress(userId: String) -> AnyPublisher<[ShippingAddress], Error>

    func addShippingAddress(userId: String, address: ShippingAddress) async throws

    func removeUserShippingAddress(userId: String) async throws
}
