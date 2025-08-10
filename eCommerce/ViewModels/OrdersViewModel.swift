//
//  OrdersViewModel.swift
//  eCommerce
//
//  Created by Imen Ksouri on 15/07/2023.
//

import Foundation
import FirebaseAuth
import Combine

@MainActor
final class OrdersViewModel: ObservableObject {
    @Published var firstName = ""
    @Published var lastName = ""
    @Published var orders: [Order] = []
    @Published var orderItems: [OrderItem] = []
    @Published var orderShippingAddress: ShippingAddress?
    private var userAuth: User?
    private let userManager: UserRepository & OrderRepository
    private var cancellables: Set<AnyCancellable> = []

    init(
        authenticationManager: AuthenticationManager,
        userManager: UserRepository & OrderRepository
    ) {
        self.userManager = userManager
        self.userAuth = authenticationManager.user
        addListenerForOrders()
    }

    func addListenerForOrders() {
        guard let userAuth else { return }
        userManager.addListenerForOrders(userId: userAuth.uid)
            .sink { completion in
                
            } receiveValue: { [weak self] orders in
                self?.orders = orders
            }
            .store(in: &cancellables)
    }

    func getAllOrderItemsForOrder(orderId: String) {
        Task {
            do {
                if let userAuth {
                    self.orderItems = try await userManager.getAllOrderItemsForOrder(userId: userAuth.uid, orderId: orderId)
                }
            } catch {
                print(error)
            }
        }
    }

    func getShippingAddressForOrder(orderId: String) {
        Task {
            do {
                if let userAuth {
                    self.orderShippingAddress = try await userManager.getShippingAddressForOrder(userId: userAuth.uid, orderId: orderId)
                }
            } catch {
                print(error)
            }
        }
    }
}
