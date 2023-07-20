//
//  DiscountProductRepository.swift
//  eCommerce
//
//  Created by Imen Ksouri on 19/07/2023.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift
import Combine

protocol DiscountProductRepository {
    var discountsCollection: CollectionReference { get }

    func discountDocument(productId: String) -> DocumentReference

    func uploadDiscount(discount: Discount) async throws

    func getDiscount(productId: String) async throws -> Discount

    func getAllDiscounts() async throws -> [Discount]
}
