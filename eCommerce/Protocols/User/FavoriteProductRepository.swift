//
//  FavoriteProductRepository.swift
//  eCommerce
//
//  Created by Imen Ksouri on 19/07/2023.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift
import Combine

protocol FavoriteProductRepository {
    func userFavoriteProductCollection(userId: String) -> CollectionReference

    func addListenerForFavoriteProducts(userId: String) -> AnyPublisher<[FavoriteProduct], Error>

    func addFavoriteProduct(userId: String, productId: String) async throws

    func removeFavoriteProduct(userId: String, favoriteProductId: String) async throws
}
