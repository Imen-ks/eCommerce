//
//  CheckoutViewModel.swift
//  eCommerce
//
//  Created by Imen Ksouri on 11/07/2023.
//

import Foundation
import FirebaseAuth
import Combine
import StripePaymentSheet

@MainActor
final class CheckoutViewModel: ObservableObject {

    let backendCheckoutUrl = URL(string: "https://sphenoid-funny-echo.glitch.me/checkout")!
    let merchantDisplayName = "Shopping App"
    @Published var userAuth: User?
    @Published var profile: Profile?
    @Published var cart: Cart?
    @Published var cartItems: [CartItem] = []
    @Published var numberOfArticles = 0
    @Published var totalAmount = 0.0
    @Published var shippingAddress: ShippingAddress?
    @Published var streetNumber = ""
    @Published var streetName = ""
    @Published var postalCode = ""
    @Published var town = ""
    @Published var country = ""
    @Published var paymentSheet: PaymentSheet?
    @Published var paymentResult: PaymentSheetResult?
    @Published var paymentIsCompleted = false
    @Published var paymentIsFailed = false
    @Published var paymentIsCancelled = false
    @Published var error = ""
    @Published var orderId = ""

    private let authenticationManager: AuthenticationManager
    private let userManager: UserRepository & CartRepository & OrderRepository
    private let paymentManager: PaymentManager
    private var cancellables: Set<AnyCancellable> = []

    init(authenticationManager: AuthenticationManager,
         userManager: UserRepository & CartRepository & OrderRepository,
         paymentManager: PaymentManager) {
        self.authenticationManager = authenticationManager
        self.userManager = userManager
        self.paymentManager = paymentManager
    }

    func getUser() {
        self.userAuth = authenticationManager.user
    }

    func getProfile() {
        Task {
            do {
                if let userAuth {
                    self.profile = try await userManager.getUserProfile(userId: userAuth.uid)
                }
            } catch {
                print(error)
            }
        }
    }

    func addListenerForCart() {
        guard let user = authenticationManager.user else { return }
        userManager.addListenerForCart(userId: user.uid)
            .sink { completion in
                
            } receiveValue: { [weak self] cart in
                self?.cart = cart.first
            }
            .store(in: &cancellables)
    }

    func addListenerForCartItems() {
        guard let user = authenticationManager.user else { return }
        userManager.addListenerForCartItems(userId: user.uid)
            .sink { completion in
                
            } receiveValue: { [weak self] cartItems in
                self?.cartItems = cartItems
            }
            .store(in: &cancellables)
    }

    func addListenerForShippingAddress() {
        guard let user = authenticationManager.user else { return }
        userManager.addListenerForShippingAddress(userId: user.uid)
            .sink { completion in
                
            } receiveValue: { [weak self] address in
                self?.shippingAddress = address.first
                self?.streetNumber = address.first?.streetNumber ?? ""
                self?.streetName = address.first?.streetName ?? ""
                self?.postalCode = address.first?.postalCode ?? ""
                self?.town = address.first?.town ?? ""
                self?.country = address.first?.country ?? ""
            }
            .store(in: &cancellables)
    }

    func addShippingAddress() {
        Task {
            do {
                if let userAuth {
                    let address = ShippingAddress(
                        id: userAuth.uid,
                        streetNumber: streetNumber,
                        streetName: streetName,
                        postalCode: postalCode,
                        town: town,
                        country: country)
                    try await userManager.addShippingAddress(
                        userId: userAuth.uid, address: address)
                }
            } catch {
                print(error)
            }
        }
    }

    func removeShippingAddress() {
        Task {
            do {
                if let userAuth {
                    try await userManager.removeUserShippingAddress(userId: userAuth.uid)
                }
            } catch {
                print(error)
            }
        }
    }

    func preparePaymentSheet() {
        Task {
            do {
                if let profile, let cart, let paymentId = profile.paymentId {
                    self.paymentSheet = try await paymentManager.preparePaymentSheet(
                        parameters: StripePaymentIntentRequest(
                            customerId: paymentId,
                            totalAmount: cart.totalAmount))
                }
            } catch {
                print(error)
            }
        }
    }

    func onPaymentCompletion(result: PaymentSheetResult) {
        self.paymentResult = result
    }

    func clearCart() {
        Task {
            if let userAuth {
                try await userManager.clearCart(userId: userAuth.uid, cartItems: cartItems)
            }
        }
    }

    func addOrder() {
        Task {
            if let userAuth, let cart, let shippingAddress {
                self.orderId = try await userManager.addOrder(userId: userAuth.uid, cart: cart, cartItems: cartItems, shippingAddress: shippingAddress)
            }
        }
    }
}

