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
import FirebaseAnalytics

@MainActor
final class CheckoutViewModel: ObservableObject {
    let numberOfArticles: Int
    let totalAmount: Double
    @Published var shippingAddress: ShippingAddress?
    @Published var streetNumber = ""
    @Published var streetName = ""
    @Published var postalCode = ""
    @Published var town = ""
    @Published var country = ""
    @Published var paymentSheet: PaymentSheet?
    @Published var paymentResult: PaymentSheetResult?
    @Published var paymentIsProcessed = false
    @Published var paymentIsCompleted = false
    @Published var paymentIsFailed = false
    @Published var paymentIsCancelled = false
    @Published var error = ""
    @Published var orderId = ""
    private var userAuth: User?
    private var profile: Profile?
    private var cart: Cart?
    private var cartItems: [CartItem] = []
    private let userManager: UserRepository & CartRepository & OrderRepository
    private let paymentManager: PaymentManager
    private var cancellables: Set<AnyCancellable> = []

    var viewController: UIViewController? = nil

    init(
        authenticationManager: AuthenticationManager,
        userManager: UserRepository & CartRepository & OrderRepository,
        paymentManager: PaymentManager,
        numberOfArticles: Int,
        totalAmount: Double
    ) {
        self.userManager = userManager
        self.paymentManager = paymentManager
        self.numberOfArticles = numberOfArticles
        self.totalAmount = totalAmount
        self.userAuth = authenticationManager.user
        getProfile()
        addListenerForCart()
        addListenerForCartItems()
        addListenerForShippingAddress()
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
        guard let userAuth else { return }
        userManager.addListenerForCart(userId: userAuth.uid)
            .sink { completion in
                
            } receiveValue: { [weak self] cart in
                self?.cart = cart.first
            }
            .store(in: &cancellables)
    }

    func addListenerForCartItems() {
        guard let userAuth else { return }
        userManager.addListenerForCartItems(userId: userAuth.uid)
            .sink { completion in
                
            } receiveValue: { [weak self] cartItems in
                self?.cartItems = cartItems
            }
            .store(in: &cancellables)
    }

    func addListenerForShippingAddress() {
        guard let userAuth else { return }
        userManager.addListenerForShippingAddress(userId: userAuth.uid)
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
                    logEventAddShippingInfo()
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
                self.paymentSheet = try await paymentManager.preparePaymentSheet(profile: profile, cart: cart)
            } catch {
                print(error)
            }
        }
    }

    /// Using Stripe's `PaymentSheet.present(from:)` method instead of the `PaymentSheet.Button to solve its internal behavior leading to the error : `Modifying state during view update, this will cause undefined behavior.`
    func presentPaymentSheet() {
        guard let paymentSheet = paymentSheet,
              let viewController = viewController else { return }

        paymentSheet.present(from: viewController) { result in
            self.onPaymentCompletion(result: result)
            self.logEventPurchase(result: result)
        }
    }

    func onPaymentCompletion(result: PaymentSheetResult) {
        self.paymentResult = result
        self.paymentIsProcessed = true
        switch result {
        case .completed:
            self.paymentIsCompleted = true
            self.clearCart()
            self.addOrder()
        case .failed(let error):
            self.paymentIsFailed = true
            self.error = error.localizedDescription
        case .canceled:
            self.paymentIsCancelled = true
        }
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

    func logEventAddShippingInfo() {
        FirebaseAnalytics.Analytics.logEvent(AnalyticsEventAddShippingInfo, parameters: [
            AnalyticsParameterLocation: "\(town), \(country)"
        ])
    }

    func logEventPurchase(result: PaymentSheetResult) {
        switch result {
        case .completed:
            FirebaseAnalytics.Analytics.logEvent(AnalyticsEventPurchase, parameters: [
                AnalyticsParameterPaymentType: "card",
                AnalyticsParameterPrice: self.totalAmount,
                AnalyticsParameterSuccess: "1",
                AnalyticsParameterCurrency: "USD"
            ])
        default:
            FirebaseAnalytics.Analytics.logEvent(AnalyticsEventPurchase, parameters: [
                AnalyticsParameterPaymentType: "card",
                AnalyticsParameterPrice: self.totalAmount,
                AnalyticsParameterSuccess: "0",
                AnalyticsParameterCurrency: "USD"
            ])
        }
    }
}

