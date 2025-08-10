//
//  ProductsViewModel.swift
//  eCommerce
//
//  Created by Imen Ksouri on 30/06/2023.
//

import Foundation
import Combine
import FirebaseAuth
import FirebaseFirestore
import FirebaseAnalytics

@MainActor
final class ProductsViewModel: ObservableObject {
    var category: MasterCategory?
    var subCategory: SubCategory?
    var showDiscountedProducts: Bool
    var showNewInProducts: Bool
    @Published var products: [Product] = []
    private var discounts: [Discount] = []
    private var favoriteProducts: [FavoriteProduct] = []
    private var userAuth: User?
    private var lastDocument: DocumentSnapshot? = nil
    private let userManager: FavoriteProductRepository
    private let productManager: ProductRepository
    private let discountProductManager: DiscountProductRepository
    private var cancellables: Set<AnyCancellable> = []

    init(
        authenticationManager: AuthenticationManager,
        userManager: FavoriteProductRepository,
        productManager: ProductRepository,
        discountProductManager: DiscountProductRepository,
        category: MasterCategory?,
        subCategory: SubCategory?,
        showDiscountedProducts: Bool,
        showNewInProducts: Bool
    ) {
        self.userManager = userManager
        self.productManager = productManager
        self.discountProductManager = discountProductManager
        self.category = category
        self.subCategory = subCategory
        self.showDiscountedProducts = showDiscountedProducts
        self.showNewInProducts = showNewInProducts
        self.userAuth = authenticationManager.user
        getProducts()
        getDiscounts()
        addListenerForFavorites()
        logEventViewItemList()
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
                if let userAuth {
                    try await userManager.addFavoriteProduct(userId: userAuth.uid, productId: product.id)
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
                if let userAuth {
                    try await userManager.removeFavoriteProduct(userId: userAuth.uid, favoriteProductId: product.id)
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
