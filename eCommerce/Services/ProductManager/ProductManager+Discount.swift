//
//  ProductManager+Discount.swift
//  eCommerce
//
//  Created by Imen Ksouri on 19/07/2023.
//

import Foundation
import FirebaseFirestore

extension ProductManager: DiscountProductRepository {
    internal func discountsCollection() -> CollectionReference { Firestore.firestore().collection("discounts")
    }

    internal func discountDocument(productId: String) -> DocumentReference {
        discountsCollection().document(productId)
    }

    func uploadDiscount(discount: Discount) async throws {
        try discountDocument(productId: discount.id).setData(from: discount, merge: false)
    }

    func getDiscount(productId: String) async throws -> Discount {
        try await discountDocument(productId: productId).getDocument(as: Discount.self)
    }

    func getAllDiscounts() async throws -> [Discount] {
        try await discountsCollection()
            .getDocuments(as: Discount.self)
    }
}
