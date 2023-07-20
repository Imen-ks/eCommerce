//
//  ProductRepository.swift
//  eCommerce
//
//  Created by Imen Ksouri on 19/07/2023.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift
import Combine

protocol ProductRepository {
    var productsCollection: CollectionReference { get }

    func productDocument(productId: String) -> DocumentReference

    func uploadProduct(product: Product) async throws

    func getProduct(productId: String) async throws -> Product

    func updateProductWithDiscount(productId: String) async throws

    func updateNewInProduct(productId: String) async throws

    func getProductsQuery(_ category: MasterCategory?,
                          _ subCategory: SubCategory?,
                          withDiscount discount: Bool,
                          isNewIn newIn: Bool) -> Query

    func getProducts(forCategory category: MasterCategory?,
                     subcategory subCategory: SubCategory?,
                     withDiscount discount: Bool,
                     isNewIn newIn: Bool,
                     count: Int,
                     lastDocument: DocumentSnapshot?
    ) async throws -> (products: [Product], lastDocument: DocumentSnapshot?)

    func getFeaturedProductsQuery(_ discount: Bool, _ newIn: Bool) -> Query?

    func getFeaturedProducts(withDiscounts discount: Bool,
                             newIn: Bool,
                             count: Int,
                             lastDocument: DocumentSnapshot?
    ) async throws -> (products: [Product], lastDocument: DocumentSnapshot?)?
}
