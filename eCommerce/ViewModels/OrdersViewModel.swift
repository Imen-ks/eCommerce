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

    @Published var userAuth: User?
    @Published var profile: Profile?
    @Published var firstName = ""
    @Published var lastName = ""
    @Published var orders: [Order] = []
    @Published var orderItems: [OrderItem] = []
    @Published var orderShippingAddress: ShippingAddress?
    private let authenticationManager: AuthenticationManager
    private let userManager: UserRepository & OrderRepository
    private var cancellables: Set<AnyCancellable> = []

    init(authenticationManager: AuthenticationManager,
         userManager: UserRepository & OrderRepository) {
        self.authenticationManager = authenticationManager
        self.userManager = userManager
    }

    func getUser() {
        self.userAuth = authenticationManager.user
    }

    func getProfile() {
        Task {
            do {
                if let userAuth {
                    self.profile = try await userManager.getUserProfile(userId: userAuth.uid)
                    self.firstName = self.profile?.firstName ?? ""
                    self.lastName = self.profile?.lastName ?? ""
                }
            } catch {
                print(error)
            }
        }
    }

    func addListenerForOrders() {
        guard let user = authenticationManager.user else { return }
        userManager.addListenerForOrders(userId: user.uid)
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
