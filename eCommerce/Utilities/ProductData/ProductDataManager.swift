//
//  ProductDataManager.swift
//  eCommerce
//
//  Created by Imen Ksouri on 22/06/2023.
//

import Foundation

#if DEBUG
final class ProductDataManager {
    static var firebaseProductManager = ProductManager()

    private init() {}

    static func loadProducts() async throws {
        for product in ProductDatabase.products {
            do {
                try await firebaseProductManager.uploadProduct(product: product)
            } catch {
                print(error)
            }
        }
    }

    static func loadDiscounts() async throws {
        for discount in DiscountDatabase.discounts {
            do {
                try await firebaseProductManager.uploadDiscount(discount: discount)
            } catch {
                print(error)
            }
        }
    }

    static func loadNewIns() async throws {
        for newIn in NewInDatabase.newIns {
            do {
                try await firebaseProductManager.uploadNewIn(newIn: newIn)
            } catch {
                print(error)
            }
        }
    }

    static func updateProductsWithDiscount() async throws {
        for discount in DiscountDatabase.discounts {
            do {
                try await firebaseProductManager.updateProductWithDiscount(productId: discount.id)
            } catch {
                print(error)
            }
        }
    }

    static func updateNewInProducts() async throws {
        for newIn in NewInDatabase.newIns {
            do {
                try await firebaseProductManager.updateNewInProduct(productId: newIn.id)
            } catch {
                print(error)
            }
        }
    }
}
#endif
