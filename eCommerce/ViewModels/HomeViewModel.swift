//
//  HomeViewModel.swift
//  eCommerce
//
//  Created by Imen Ksouri on 16/07/2023.
//

import Foundation
import FirebaseFirestore

@MainActor
final class HomeViewModel: ObservableObject {

    @Published var discounts: [Discount] = []
    @Published var featuredDiscountedProducts: [Product] = []
    @Published var featuredNewInProducts: [Product] = []
    @Published var showDiscountedProducts = false
    @Published var showNewInProducts = false
    private let authenticationManager: AuthenticationManager
    private let productManager: ProductRepository
    private let discountProductManager: DiscountProductRepository

    init(authenticationManager: AuthenticationManager,
         productManager: ProductRepository,
         discountProductManager: DiscountProductRepository) {
        self.authenticationManager = authenticationManager
        self.productManager = productManager
        self.discountProductManager = discountProductManager
    }

    func getDiscounts() {
        Task {
            do {
                self.discounts = try await discountProductManager.getAllDiscounts()
            } catch {
                print(error)
            }
        }
    }

    func getDiscountForId(_ productId: String) -> Discount? {
        return self.discounts.first { $0.id == productId }
    }

    func getFeaturedDiscountedProducts() {
        Task {
            do {
                if let (newProducts, _) = try await productManager.getFeaturedProducts(withDiscounts: true, newIn: false, count: 10, lastDocument: nil) {
                    self.featuredDiscountedProducts.append(contentsOf: newProducts)
                }
            } catch {
                print(error)
            }
        }
    }

    func getFeaturedNewInProducts() {
        Task {
            do {
                if let (newProducts, _) = try await productManager.getFeaturedProducts(withDiscounts: false, newIn: true, count: 10, lastDocument: nil) {
                    self.featuredNewInProducts.append(contentsOf: newProducts)
                }
            } catch {
                print(error)
            }
        }
    }
}
