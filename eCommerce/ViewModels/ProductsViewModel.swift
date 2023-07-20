//
//  ProductsViewModel.swift
//  eCommerce
//
//  Created by Imen Ksouri on 30/06/2023.
//

import Foundation
import FirebaseFirestore
import Combine

@MainActor
final class ProductsViewModel: ObservableObject {

    @Published var products: [Product] = []
    @Published var discounts: [Discount] = []
    @Published var showDiscountedProducts = false
    @Published var showNewInProducts = false
    private var lastDocument: DocumentSnapshot? = nil
    private var category: MasterCategory?
    private var subCategory: SubCategory?
    private let productManager: ProductRepository
    private let discountProductManager: DiscountProductRepository
    private var cancellables: Set<AnyCancellable> = []

    init(productManager: ProductRepository,
         discountProductManager: DiscountProductRepository,
         category: MasterCategory?,
         subCategory: SubCategory?) {
        self.productManager = productManager
        self.discountProductManager = discountProductManager
        self.category = category
        self.subCategory = subCategory
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

    func getDiscountForId(_ productId: String) -> Discount? {
        return self.discounts.first { $0.id == productId }        
    }
}
