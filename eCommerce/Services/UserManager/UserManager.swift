//
//  UserManager.swift
//  eCommerce
//
//  Created by Imen Ksouri on 19/06/2023.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift
import Combine

final class UserManager: UserRepository {
    internal let userCollection: CollectionReference = Firestore.firestore().collection("users")
    internal var userFavoriteProductsListener: ListenerRegistration? = nil
    internal var userCartListener: ListenerRegistration? = nil
    internal var userCartItemsListener: ListenerRegistration? = nil
    internal var userShippingAddressListener: ListenerRegistration? = nil
    internal var userOrdersListener: ListenerRegistration? = nil

    internal func userDocument(userId: String) -> DocumentReference {
        userCollection.document(userId)
    }

    internal func userShippingAddressCollection(userId: String) -> CollectionReference {
        userDocument(userId: userId).collection("shipping_address")
    }

    internal func userShippingAddressDocument(userId: String) -> DocumentReference {
        userShippingAddressCollection(userId: userId).document(userId)
    }

    func createNewUser(user: Profile) async throws {
        try userDocument(userId: user.uid).setData(from: user, merge: false)
    }

    func updateUserInfo(userId: String,
                        firstName: String,
                        lastName: String,
                        phoneNumber: String) async throws {
        let data: [String:Any] = [
            Profile.CodingKeys.firstName.rawValue : firstName,
            Profile.CodingKeys.lastName.rawValue : lastName,
            Profile.CodingKeys.phoneNumber.rawValue : phoneNumber
        ]
        try await userDocument(userId: userId).updateData(data)
    }

    func updateUserEmail(userId: String, email: String) async throws {
        let data: [String:Any] = [
            Profile.CodingKeys.email.rawValue : email
        ]
        try await userDocument(userId: userId).updateData(data)
    }

    func initCart(userId: String) async throws {
        let newCart = Cart(id: userId)
        try userCartDocument(userId: userId).setData(from: newCart, merge: false)
    }

    func getUserProfile(userId: String) async throws -> Profile {
        try await userDocument(userId: userId).getDocument(as: Profile.self)
    }

    func addListenerForShippingAddress(userId: String) -> AnyPublisher<[ShippingAddress], Error> {
        let (publisher, listener) = userShippingAddressCollection(userId: userId)
            .addSnapshotListener(as: ShippingAddress.self)
        self.userShippingAddressListener = listener
        return publisher
    }

    func addShippingAddress(userId: String, address: ShippingAddress) async throws {
        try userShippingAddressDocument(userId: userId).setData(from: address, merge: false)
    }

    func removeUserShippingAddress(userId: String) async throws {
        try await userShippingAddressDocument(userId: userId).delete()
    }
}
