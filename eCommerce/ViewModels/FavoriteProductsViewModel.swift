//
//  FavoriteProductsViewModel.swift
//  eCommerce
//
//  Created by Imen Ksouri on 02/07/2023.
//

import Foundation
import Combine

@MainActor
final class FavoriteProductsViewModel: ObservableObject {

    @Published var favoriteProducts: [FavoriteProduct] = []
    @Published var discountedProducts: [Discount] = []
    private let authenticationManager: AuthenticationManager
    private let userManager: FavoriteProductRepository
    private let productManager: ProductRepository
    private let discountProductManager: DiscountProductRepository
    private var cancellables: Set<AnyCancellable> = []

    init(authenticationManager: AuthenticationManager,
         userManager: FavoriteProductRepository,
         productManager: ProductRepository,
         discountProductManager: DiscountProductRepository) {
        self.authenticationManager = authenticationManager
        self.userManager = userManager
        self.productManager = productManager
        self.discountProductManager = discountProductManager
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
}
