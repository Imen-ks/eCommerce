//
//  NewInProductRepository.swift
//  eCommerce
//
//  Created by Imen Ksouri on 19/07/2023.
//

import Foundation
import FirebaseFirestore
import Combine

protocol NewInProductRepository {
    func newInsCollection() -> CollectionReference

    func newInDocument(productId: String) -> DocumentReference

    func uploadNewIn(newIn: NewIn) async throws

    func getNewIn(productId: String) async throws -> NewIn

    func getAllNewIns() async throws -> [NewIn]
}
