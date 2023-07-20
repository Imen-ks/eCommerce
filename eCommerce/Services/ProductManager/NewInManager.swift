//
//  NewInManager.swift
//  eCommerce
//
//  Created by Imen Ksouri on 19/07/2023.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

final class NewInProductManager: NewInProductRepository {
    internal let newInsCollection = Firestore.firestore().collection("new_ins")

    internal func newInDocument(productId: String) -> DocumentReference {
        newInsCollection.document(productId)
    }

    func uploadNewIn(newIn: NewIn) async throws {
        try newInDocument(productId: newIn.id).setData(from: newIn, merge: false)
    }

    func getNewIn(productId: String) async throws -> NewIn {
        try await newInDocument(productId: productId).getDocument(as: NewIn.self)
    }

    func getAllNewIns() async throws -> [NewIn] {
        try await newInsCollection
            .getDocuments(as: NewIn.self)
    }
}
