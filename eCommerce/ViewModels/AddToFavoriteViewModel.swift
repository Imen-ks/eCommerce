//
//  AddToFavoriteViewModel.swift
//  eCommerce
//
//  Created by Imen Ksouri on 10/08/2025.
//

import Foundation
import Combine
import FirebaseAuth
import FirebaseAnalytics

@MainActor
final class AddToFavoriteViewModel: ObservableObject {
    var product: Product
    var discount: Discount?
    @Published var favoriteProducts: [FavoriteProduct] = []
    private var userAuth: User?
    private let userManager: CartRepository & FavoriteProductRepository
    private var cancellables: Set<AnyCancellable> = []

    init(
        authenticationManager: AuthenticationManager,
        userManager: CartRepository & FavoriteProductRepository,
        product: Product,
        discount: Discount?
    ) {
        self.userManager = userManager
        self.product = product
        self.discount = discount
        self.userAuth = authenticationManager.user
        addListenerForFavorites()
    }

    func addListenerForFavorites() {
        guard let userAuth else { return }
        userManager.addListenerForFavoriteProducts(userId: userAuth.uid)
            .sink { completion in
                
            } receiveValue: { [weak self] products in
                self?.favoriteProducts = products
            }
            .store(in: &cancellables)
    }

    func addFavoriteProduct() {
        Task {
            do {
                if let userAuth {
                    try await userManager.addFavoriteProduct(userId: userAuth.uid, productId: product.id)
                    logEventAddToFavorites()
                }
            } catch {
                print(error)
            }
        }
    }

    func removeFavoriteProduct() {
        Task {
            do {
                if let userAuth {
                    try await userManager.removeFavoriteProduct(userId: userAuth.uid, favoriteProductId: product.id)
                }
            } catch {
                print(error)
            }
        }
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
}
