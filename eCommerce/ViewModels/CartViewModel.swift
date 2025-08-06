//
//  CartViewModel.swift
//  eCommerce
//
//  Created by Imen Ksouri on 03/07/2023.
//

import Foundation
import Combine
import FirebaseAnalytics

@MainActor
final class CartViewModel: ObservableObject {

    @Published var cart: Cart?
    @Published var cartItems: [CartItem] = []
    @Published var discountedProducts: [Discount] = []
    private let authenticationManager: AuthenticationManager
    private let userManager: CartRepository
    private let productManager: ProductRepository
    private let discountProductManager: DiscountProductRepository
    private var cancellables: Set<AnyCancellable> = []

    init(authenticationManager: AuthenticationManager,
         userManager: CartRepository,
         productManager: ProductRepository,
         discountProductManager: DiscountProductRepository) {
        self.authenticationManager = authenticationManager
        self.userManager = userManager
        self.productManager = productManager
        self.discountProductManager = discountProductManager
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
                self?.cartItems = cartItems.sorted { $0.dateAdded > $1.dateAdded }
            }
            .store(in: &cancellables)
    }

    func removeFromCart(item: CartItem) {
        Task {
            do {
                if let user = authenticationManager.user {
                    try await userManager.removeFromCart(userId: user.uid, item: item)
                    logEventRemoveFromCart(item: item)
                }
            } catch {
                print(error)
            }
        }
    }

    func increaseQuantity(item: CartItem) {
        var newQuantity = item.quantity
        newQuantity += 1
        Task {
            do {
                if let user = authenticationManager.user {
                    try await userManager.increaseCartItemQuantity(userId: user.uid, item: item, newQuantity: newQuantity)
                    logEventIncreaseQuantity(item: item)
                }
            } catch {
                print(error)
            }
        }
    }

    func decreaseQuantity(item: CartItem) {
        var newQuantity = item.quantity
        newQuantity -= 1
        Task {
            do {
                if let user = authenticationManager.user {
                    try await userManager.decreaseCartItemQuantity(userId: user.uid, item: item, newQuantity: newQuantity)
                    logEventDecreaseQuantity(item: item)
                }
            } catch {
                print(error)
            }
        }
    }

    func getDiscounts() {
        Task {
            do {
                self.discountedProducts = try await discountProductManager.getAllDiscounts()
            } catch {
                print(error)
            }
        }
    }

    func getDiscountForId(_ productId: String) -> Discount? {
        return self.discountedProducts.first { $0.id == productId }
    }

    func getProductForId(_ productId: String) async throws -> Product? {
            do {
                return try await productManager.getProduct(productId: productId)
            } catch {
                print(error)
            }
        return nil
    }

    func logEventViewCart() {
        FirebaseAnalytics.Analytics.logEvent(AnalyticsEventViewCart, parameters: [
            AnalyticsParameterQuantity: cartItems.map { $0.quantity }.reduce(0, +),
            AnalyticsParameterPrice: cart?.totalAmount ?? 0,
            AnalyticsParameterDiscount: cart?.discountAmount ?? 0,
            AnalyticsParameterCurrency: "USD",
        ])
    }

    func logEventRemoveFromCart(item: CartItem) {
        FirebaseAnalytics.Analytics.logEvent(AnalyticsEventRemoveFromCart, parameters: [
            AnalyticsParameterItemBrand: item.brand,
            AnalyticsParameterItemName: item.name,
            AnalyticsParameterItemVariant: item.colorName,
            AnalyticsParameterQuantity: item.quantity,
            AnalyticsParameterPrice: item.price,
            AnalyticsParameterDiscount: item.discountPercent,
            AnalyticsParameterCurrency: "USD",
        ])
    }

    func logEventIncreaseQuantity(item: CartItem) {
        FirebaseAnalytics.Analytics.logEvent(AnalyticsEventAddToCart, parameters: [
            AnalyticsParameterItemBrand: item.brand,
            AnalyticsParameterItemName: item.name,
            AnalyticsParameterItemVariant: item.colorName,
            AnalyticsParameterQuantity: 1,
            AnalyticsParameterPrice: item.price,
            AnalyticsParameterDiscount: item.discountPercent,
            AnalyticsParameterCurrency: "USD",
        ])
    }

    func logEventDecreaseQuantity(item: CartItem) {
        FirebaseAnalytics.Analytics.logEvent(AnalyticsEventRemoveFromCart, parameters: [
            AnalyticsParameterItemBrand: item.brand,
            AnalyticsParameterItemName: item.name,
            AnalyticsParameterItemVariant: item.colorName,
            AnalyticsParameterQuantity: 1,
            AnalyticsParameterPrice: item.price,
            AnalyticsParameterDiscount: item.discountPercent,
            AnalyticsParameterCurrency: "USD",
        ])
    }

    func logEventBeginCheckout() {
        FirebaseAnalytics.Analytics.logEvent(AnalyticsEventBeginCheckout, parameters: [
            AnalyticsParameterQuantity: cartItems.map { $0.quantity }.reduce(0, +),
            AnalyticsParameterPrice: cart?.totalAmount ?? 0,
            AnalyticsParameterDiscount: cart?.discountAmount ?? 0,
            AnalyticsParameterCurrency: "USD",
        ])
    }
}
