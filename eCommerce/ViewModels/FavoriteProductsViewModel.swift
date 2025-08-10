//
//  FavoriteProductsViewModel.swift
//  eCommerce
//
//  Created by Imen Ksouri on 02/07/2023.
//

import Foundation
import Combine
import FirebaseAuth

@MainActor
final class FavoriteProductsViewModel: ObservableObject {
    @Published var favoriteProducts: [FavoriteProduct] = []
    private var discountedProducts: [Discount] = []
    private var userAuth: User?
    private let userManager: FavoriteProductRepository
    private let productManager: ProductRepository
    private let discountProductManager: DiscountProductRepository
    private var cancellables: Set<AnyCancellable> = []

    init(
        authenticationManager: AuthenticationManager,
        userManager: FavoriteProductRepository,
        productManager: ProductRepository,
        discountProductManager: DiscountProductRepository
    ) {
        self.userManager = userManager
        self.productManager = productManager
        self.discountProductManager = discountProductManager
        self.userAuth = authenticationManager.user
        getDiscounts()
        addListenerForFavorites()
    }

    func addListenerForFavorites() {
        guard let userAuth else { return }
        userManager.addListenerForFavoriteProducts(userId: userAuth.uid)
            .sink { completion in
                
            } receiveValue: { [weak self] products in
                self?.favoriteProducts = products.sorted { $0.id > $1.id }
            }
            .store(in: &cancellables)
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
