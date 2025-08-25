//
//  AddToCartViewModel.swift
//  eCommerce
//
//  Created by Imen Ksouri on 10/08/2025.
//

import Foundation
import Combine
import FirebaseAuth
import FirebaseAnalytics

@MainActor
final class AddToCartViewModel: ObservableObject {
    var product: Product
    var discount: Discount?
    var selectedVariant: Int
    var selectedSize: Int?
    var quantity: Int
    @Published var cartItems: [CartItem] = []
    private var userAuth: User?
    private let userManager: CartRepository
    private var cancellables: Set<AnyCancellable> = []

    init(
        authenticationManager: AuthenticationManager,
        userManager: CartRepository,
        product: Product,
        discount: Discount?,
        selectedVariant: Int,
        selectedSize: Int?,
        quantity: Int
    ) {
        self.userManager = userManager
        self.product = product
        self.discount = discount
        self.selectedVariant = selectedVariant
        self.selectedSize = selectedSize
        self.quantity = quantity
        self.userAuth = authenticationManager.user
        addListenerForCartItems()
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

    func addToCart() {
        Task {
            do {
                if let userAuth {
                    if let selectedSize {
                        let id = "\(product.id)-\(selectedVariant)-\(selectedSize)"
                        let variant = product.variants[selectedVariant]
                        let size = product.sizes[selectedSize]
                        let item = CartItem(
                            id: id,
                            name: product.name,
                            brand: product.brand,
                            size: size,
                            price: product.price,
                            discountPercent: discount?.discountPercent ?? 0,
                            quantity: quantity,
                            colorName: variant.colorName,
                            imageUrl: variant.imageUrl,
                            dateAdded: Date()
                        )
                        if let existingItem = cartItems.first(where: { $0.id == id }) {
                            try await userManager.increaseCartItemQuantity(userId: userAuth.uid, item: existingItem, newQuantity: (existingItem.quantity + 1))
                        } else {
                            try await userManager.addToCart(userId: userAuth.uid, item: item)
                        }
                        logEventAddToCart()
                    }
                }
            } catch {
                print(error)
            }
        }
    }

    func logEventAddToCart() {
        FirebaseAnalytics.Analytics.logEvent(AnalyticsEventAddToCart, parameters: [
            AnalyticsParameterItemBrand: product.brand,
            AnalyticsParameterItemName: product.name,
            AnalyticsParameterItemCategory: product.category,
            AnalyticsParameterItemCategory2: product.subCategory,
            AnalyticsParameterItemVariant: product.variants[selectedVariant].colorName,
            AnalyticsParameterPrice: product.price,
            AnalyticsParameterCurrency: "USD",
            AnalyticsParameterDiscount: discount?.discountPercent ?? 0
        ])
    }
}
