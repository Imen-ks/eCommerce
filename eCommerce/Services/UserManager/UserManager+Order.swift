//
//  UserManager+Order.swift
//  eCommerce
//
//  Created by Imen Ksouri on 19/07/2023.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift
import Combine

extension UserManager: OrderRepository {
    internal func userOrdersCollection(userId: String) -> CollectionReference {
        userDocument(userId: userId).collection("orders")
    }

    internal func userOrderItemsCollection(userId: String, documentId: String) -> CollectionReference {
        userOrdersCollection(userId: userId).document(documentId).collection("order_items")
    }

    internal func userOrderShippingAddressCollection(userId: String, documentId: String) -> CollectionReference {
        userOrdersCollection(userId: userId).document(documentId).collection("shipping_address")
    }

    func addListenerForOrders(userId: String) -> AnyPublisher<[Order], Error> {
        let (publisher, listener) = userOrdersCollection(userId: userId)
            .addSnapshotListener(as: Order.self)
        self.userOrdersListener = listener
        return publisher
    }

    func addOrder(userId: String, cart: Cart, cartItems: [CartItem], shippingAddress: ShippingAddress) async throws -> String {
        var orderId = UUID().uuidString
        orderId = String(orderId[orderId.index(orderId.startIndex, offsetBy: 24)...])
        let orderDocument = userOrdersCollection(userId: userId).document(orderId)
        let order = Order(id: orderId,
                          userId: userId,
                          freightCosts: cart.freightCosts,
                          discountAmount: cart.discountAmount,
                          totalAmount: cart.totalAmount,
                          numberOfArticles: cartItems.map {$0.quantity}.reduce(0, +),
                          dateCreated: Date())
        try orderDocument.setData(from: order, merge: false)
        for item in cartItems {
            let orderItemDocument = userOrderItemsCollection(userId: userId, documentId: orderId).document()
            let documentId = orderItemDocument.documentID
            let orderItem = OrderItem(id: documentId,
                                      orderId: orderId,
                                      name: item.name,
                                      brand: item.brand,
                                      size: item.size,
                                      price: item.price,
                                      quantity: item.quantity,
                                      colorName: item.colorName,
                                      imageUrl: item.imageUrl)
            try orderItemDocument.setData(from: orderItem, merge: false)
        }
        let orderShippingAddress = ShippingAddress(id: orderId,
                                                   streetNumber: shippingAddress.streetNumber,
                                                   streetName: shippingAddress.streetName,
                                                   postalCode: shippingAddress.postalCode,
                                                   town: shippingAddress.town,
                                                   country: shippingAddress.country)
        try userOrderShippingAddressCollection(userId: userId, documentId: orderId).document(orderId).setData(from: orderShippingAddress, merge: false)
        return orderId
    }

    func getAllOrderItemsForOrder(userId: String, orderId: String) async throws -> [OrderItem] {
        try await userOrderItemsCollection(userId: userId, documentId: orderId)
            .getDocuments(as: OrderItem.self)
    }

    func getShippingAddressForOrder(userId: String, orderId: String) async throws -> ShippingAddress {
        try await userOrderShippingAddressCollection(userId: userId, documentId: orderId).document(orderId)
            .getDocument(as: ShippingAddress.self)
    }
}
