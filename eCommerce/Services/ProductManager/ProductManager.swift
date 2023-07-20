//
//  ProductManager.swift
//  eCommerce
//
//  Created by Imen Ksouri on 23/06/2023.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

final class ProductManager: ProductRepository {    
    internal let productsCollection = Firestore.firestore().collection("products")

    internal func productDocument(productId: String) -> DocumentReference {
        productsCollection.document(productId)
    }
    
    func uploadProduct(product: Product) async throws {
        try productDocument(productId: product.id).setData(from: product, merge: false)
    }

    func getProduct(productId: String) async throws -> Product {
        try await productDocument(productId: productId).getDocument(as: Product.self)
    }

    func updateProductWithDiscount(productId: String) async throws {
        let data: [String:Any] = [
            Product.CodingKeys.isDiscounted.rawValue : true
        ]
        try await productDocument(productId: productId).updateData(data)
    }

    func updateNewInProduct(productId: String) async throws {
        let data: [String:Any] = [
            Product.CodingKeys.isNewIn.rawValue : true
        ]
        try await productDocument(productId: productId).updateData(data)
    }

    internal func getProductsQuery(_ category: MasterCategory?, _ subCategory: SubCategory?, withDiscount discount: Bool, isNewIn newIn: Bool) -> Query {
        if let category, let subCategory {
            return productsCollection
                .whereField(Product.CodingKeys.category.rawValue, isEqualTo: category.rawValue)
                .whereField(Product.CodingKeys.subCategory.rawValue, isEqualTo: subCategory.rawValue)
        } else if let category {
            return productsCollection
                .whereField(Product.CodingKeys.category.rawValue, isEqualTo: category.rawValue)
                .whereField(Product.CodingKeys.isNewIn.rawValue, isEqualTo: true)
        } else if discount {
            return productsCollection
                .whereField(Product.CodingKeys.isDiscounted.rawValue, isEqualTo: true)
        } else if newIn {
            return productsCollection
                .whereField(Product.CodingKeys.isNewIn.rawValue, isEqualTo: true)
        } else {
            return productsCollection
        }
    }

    func getProducts(forCategory category: MasterCategory? = nil,
                     subcategory subCategory: SubCategory? = nil,
                     withDiscount discount: Bool = false,
                     isNewIn newIn: Bool = false,
                     count: Int,
                     lastDocument: DocumentSnapshot?
    ) async throws -> (products: [Product], lastDocument: DocumentSnapshot?) {
        let query: Query = getProductsQuery(category, subCategory, withDiscount: discount, isNewIn: newIn)
        return try await query
            .limit(to: count)
            .startOptionally(afterDocument: lastDocument)
            .getDocumentsWithSnapshot(as: Product.self)
    }

    internal func getFeaturedProductsQuery(_ discount: Bool = false, _ newIn: Bool = false) -> Query? {
        if discount {
            return productsCollection
                .whereField(Product.CodingKeys.isDiscounted.rawValue, isEqualTo: true)
        }
        if newIn {
            return productsCollection
                .whereField(Product.CodingKeys.isNewIn.rawValue, isEqualTo: true)
        }
        return nil
    }

    func getFeaturedProducts(withDiscounts discount: Bool = false,
                             newIn: Bool = false,
                             count: Int,
                             lastDocument: DocumentSnapshot?
    ) async throws -> (products: [Product], lastDocument: DocumentSnapshot?)? {
        if let query: Query = getFeaturedProductsQuery(discount, newIn) {
            return try await query
                .limit(to: count)
                .startOptionally(afterDocument: lastDocument)
                .getDocumentsWithSnapshot(as: Product.self)
        }
        return nil
    }
}
