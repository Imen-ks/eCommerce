//
//  UserManager+FavoriteProduct.swift
//  eCommerce
//
//  Created by Imen Ksouri on 19/07/2023.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift
import Combine

extension UserManager: FavoriteProductRepository {
    internal func userFavoriteProductCollection(userId: String) -> CollectionReference {
        userDocument(userId: userId).collection("favorite_products")
    }

    func addListenerForFavoriteProducts(userId: String) -> AnyPublisher<[FavoriteProduct], Error> {
        let (publisher, listener) = userFavoriteProductCollection(userId: userId)
            .addSnapshotListener(as: FavoriteProduct.self)
        self.userFavoriteProductsListener = listener
        return publisher
    }

    func addFavoriteProduct(userId: String, productId: String) async throws {
        let document = userFavoriteProductCollection(userId: userId).document(productId)
        let data: [String:Any] = [
            FavoriteProduct.CodingKeys.id.rawValue : productId,
        ]
        try await document.setData(data, merge: false)
    }

    func removeFavoriteProduct(userId: String, favoriteProductId: String) async throws {
        try await userFavoriteProductCollection(userId: userId).document(favoriteProductId).delete()
    }
}
