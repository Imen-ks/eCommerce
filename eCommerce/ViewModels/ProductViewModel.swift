//
//  ProductViewModel.swift
//  eCommerce
//
//  Created by Imen Ksouri on 03/07/2023.
//

import Foundation
import Combine
import FirebaseAnalytics

@MainActor
final class ProductViewModel: ObservableObject {

    @Published var product: Product
    @Published var discount: Discount?
    @Published var selectedVariant: Int = 0
    @Published var selectedSize: Int?
    @Published var quantity: Int = 1
    @Published var favoriteProducts: [FavoriteProduct] = []
    @Published var cartItems: [CartItem] = []
    private let authenticationManager: AuthenticationManager
    private let userManager: CartRepository & FavoriteProductRepository
    private var cancellables: Set<AnyCancellable> = []

    init(authenticationManager: AuthenticationManager,
        userManager: CartRepository & FavoriteProductRepository,
        product: Product,
        discount: Discount?) {
            self.authenticationManager = authenticationManager
            self.userManager = userManager
            self.product = product
            self.discount = discount
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

    func addListenerForFavorites() {
        guard let user = authenticationManager.user else { return }
        userManager.addListenerForFavoriteProducts(userId: user.uid)
            .sink { completion in
                
            } receiveValue: { [weak self] products in
                self?.favoriteProducts = products
            }
            .store(in: &cancellables)
    }

    func addFavoriteProduct(productId: String) {
        Task {
            do {
                if let user = authenticationManager.user {
                    try await userManager.addFavoriteProduct(userId: user.uid, productId: productId)
                    logEventAddToFavorites()
                }
            } catch {
                print(error)
            }
        }
    }

    func removeFavoriteProduct(productId: String) {
        Task {
            do {
                if let user = authenticationManager.user {
                    try await userManager.removeFavoriteProduct(userId: user.uid, favoriteProductId: productId)
                }
            } catch {
                print(error)
            }
        }
    }

    func addToCart(product: Product, discount: Discount?) {
        Task {
            do {
                if let user = authenticationManager.user {
                    if let selectedSize {
                        let id = "\(product.id)-\(selectedVariant)-\(selectedSize)"
                        let variant = product.variants[selectedVariant]
                        let size = product.sizes[selectedSize]
                        let item = CartItem(id: id,
                                            name: product.name,
                                            brand: product.brand,
                                            size: size,
                                            price: product.price,
                                            discountPercent: discount?.discountPercent ?? 0,
                                            quantity: quantity,
                                            colorName: variant.colorName,
                                            imageUrl: variant.imageUrl,
                                            dateAdded: Date())
                        if let existingItem = cartItems.first(where: { $0.id == id }) {
                            try await userManager.increaseCartItemQuantity(userId: user.uid, item: existingItem, newQuantity: (existingItem.quantity + 1))
                        } else {
                            try await userManager.addToCart(userId: user.uid,
                                                                   item: item)
                        }
                        logEventAddToCart()
                    }
                }
            } catch {
                print(error)
            }
        }
    }

    func getVariantIndex(url : String) -> Int {
        let urls = product.variants.map { $0.imageUrl }
        guard let index = urls.firstIndex(of: url) else {
            return 0
        }
        return index
    }

    func getSizeIndex(size : String) -> Int {
        let sizes = product.sizes
        guard let index = sizes.firstIndex(of: size) else {
            return 0
        }
        return index
    }

    func logEventViewItem() {
        FirebaseAnalytics.Analytics.logEvent(AnalyticsEventViewItem, parameters: [
            AnalyticsParameterItemBrand: product.brand,
            AnalyticsParameterItemName: product.name,
            AnalyticsParameterItemCategory: product.category,
            AnalyticsParameterItemCategory2: product.subCategory,
            AnalyticsParameterPrice: product.price,
            AnalyticsParameterCurrency: "USD",
            AnalyticsParameterDiscount: discount?.discountPercent ?? 0
        ])
    }

    func logEventAddToFavorites() {
        FirebaseAnalytics.Analytics.logEvent(AnalyticsEventAddToWishlist, parameters: [
            AnalyticsParameterItemBrand: product.brand,
            AnalyticsParameterItemName: product.name,
            AnalyticsParameterItemCategory: product.category,
            AnalyticsParameterItemCategory2: product.subCategory,
            AnalyticsParameterPrice: product.price,
            AnalyticsParameterCurrency: "USD",
            AnalyticsParameterDiscount: discount?.discountPercent ?? 0
        ])
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
