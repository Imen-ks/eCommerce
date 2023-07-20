//
//  Query+Extension.swift
//  eCommerce
//
//  Created by Imen Ksouri on 30/06/2023.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift
import Combine

extension Query {

    func getDocuments<T: Decodable>(as type: T.Type) async throws -> [T] {
        try await getDocumentsWithSnapshot(as: type).products
    }
    
    func getDocumentsWithSnapshot<T: Decodable>(as type: T.Type) async throws -> (products: [T], lastDocument: DocumentSnapshot?) {
        let snapshot = try await self.getDocuments()
        
        let products = try snapshot.documents.map({ document in
            try document.data(as: T.self)
        })
        
        return (products, snapshot.documents.last)
    }

    func startOptionally(afterDocument lastDocument: DocumentSnapshot?) -> Query {
        guard let lastDocument else { return self }
        return self.start(afterDocument: lastDocument)
    }

    func addSnapshotListener<T: Decodable>(as type: T.Type) -> (AnyPublisher<[T], Error>, ListenerRegistration) {
        let publisher = PassthroughSubject<[T], Error>()
        
        let listener = self.addSnapshotListener { querySnapshot, error in
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                return
            }            
            let products: [T] = documents.compactMap({ try? $0.data(as: T.self) })
            publisher.send(products)
        }
        return (publisher.eraseToAnyPublisher(), listener)
    }
}
