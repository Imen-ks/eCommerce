//
//  ProductsViewModel.swift
//  eCommerce
//
//  Created by Imen Ksouri on 30/06/2023.
//

import Foundation
import FirebaseFirestore
import Combine
import FirebaseAnalytics

@MainActor
final class ProductsViewModel: ObservableObject {

    @Published var products: [Product] = []
    @Published var discounts: [Discount] = []
    @Published var showDiscountedProducts = false
    @Published var showNewInProducts = false
    @Published var favoriteProducts: [FavoriteProduct] = []
    private var lastDocument: DocumentSnapshot? = nil
    private var category: MasterCategory?
    private var subCategory: SubCategory?
    private let authenticationManager: AuthenticationManager
    private let userManager: FavoriteProductRepository
    private let productManager: ProductRepository
    private let discountProductManager: DiscountProductRepository
    private var cancellables: Set<AnyCancellable> = []

    init(authenticationManager: AuthenticationManager,
         userManager: FavoriteProductRepository,
         productManager: ProductRepository,
         discountProductManager: DiscountProductRepository,
         category: MasterCategory?,
         subCategory: SubCategory?) {
        self.authenticationManager = authenticationManager
        self.userManager = userManager
        self.productManager = productManager
        self.discountProductManager = discountProductManager
        self.category = category
        self.subCategory = subCategory
    }

    func addListenerForFavorites() {
        guard let user = authenticationManager.user else { return }
        userManager.addListenerForFavoriteProducts(userId: user.uid)
            .sink { completion in
                
            } receiveValue: { [weak self] products in
                self?.favoriteProducts = products.sorted { $0.id > $1.id }
            }
            .store(in: &cancellables)
    }

    func getProducts() {
        Task {
            do {
                let (newProducts, lastDocument) = try await productManager.getProducts(forCategory: category, subcategory: subCategory, withDiscount: showDiscountedProducts, isNewIn: showNewInProducts, count: 10, lastDocument: lastDocument)
                
                self.products.append(contentsOf: newProducts)
                if let lastDocument {
                    self.lastDocument = lastDocument
                }
            } catch {
                print(error)
            }
        }
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

    func getDiscountForProduct(_ product: Product) -> Discount? {
        return self.discounts.first { $0.id == product.id }
    }

    func addFavoriteProduct(_ product: Product) {
        Task {
            do {
                if let user = authenticationManager.user {
                    try await userManager.addFavoriteProduct(userId: user.uid, productId: product.id)
                    logEventAddToFavorites(product)
                }
            } catch {
                print(error)
            }
        }
    }

    func removeFavoriteProduct(_ product: Product) {
        Task {
            do {
                if let user = authenticationManager.user {
                    try await userManager.removeFavoriteProduct(userId: user.uid, favoriteProductId: product.id)
                }
            } catch {
                print(error)
            }
        }
    }

    func logEventViewItemList() {
        FirebaseAnalytics.Analytics.logEvent(AnalyticsEventViewItemList, parameters: [
            AnalyticsParameterItemCategory: category?.rawValue ?? "All",
            AnalyticsParameterItemCategory2: subCategory?.rawValue ?? "All",
        ])
    }

    func logEventAddToFavorites(_ product: Product) {
        FirebaseAnalytics.Analytics.logEvent(AnalyticsEventAddToWishlist, parameters: [
            AnalyticsParameterItemBrand: product.brand,
            AnalyticsParameterItemName: product.name,
            AnalyticsParameterItemCategory: product.category,
            AnalyticsParameterItemCategory2: product.subCategory,
            AnalyticsParameterPrice: product.price,
            AnalyticsParameterCurrency: "USD",
            AnalyticsParameterDiscount: getDiscountForProduct(product)?.discountPercent ?? 0
        ])
    }
}
