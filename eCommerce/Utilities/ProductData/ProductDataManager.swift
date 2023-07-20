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
    static var firebaseDiscountProductManager = DiscountProductManager()
    static var firebaseNewInProductManager = NewInProductManager()

    private init() {}

    static func loadProducts() async throws {
        for product in ProductDatabase.products {
            do {
                try await firebaseProductManager.uploadProduct(product: product)
            } catch {
                print(String(describing: error))
            }
        }
    }

    static func loadDiscounts() async throws {
        for discount in DiscountDatabase.discounts {
            do {
                try await firebaseDiscountProductManager.uploadDiscount(discount: discount)
            } catch {
                print(String(describing: error))
            }
        }
    }

    static func loadNewIns() async throws {
        for newIn in NewInDatabase.newIns {
            do {
                try await firebaseNewInProductManager.uploadNewIn(newIn: newIn)
            } catch {
                print(String(describing: error))
            }
        }
    }

    static func updateProductsWithDiscount() async throws {
        for discount in DiscountDatabase.discounts {
            do {
                try await firebaseProductManager.updateProductWithDiscount(productId: discount.id)
            } catch {
                print(String(describing: error))
            }
        }
    }

    static func updateNewInProducts() async throws {
        for newIn in NewInDatabase.newIns {
            do {
                try await firebaseProductManager.updateNewInProduct(productId: newIn.id)
            } catch {
                print(String(describing: error))
            }
        }
    }
}
#endif
