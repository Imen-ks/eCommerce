//
//  AddToFavoriteButtonView.swift
//  eCommerce
//
//  Created by Imen Ksouri on 02/07/2023.
//

import SwiftUI

struct AddToFavoriteButtonView: View {
    @ObservedObject var viewModel: AddToFavoriteViewModel

    init(
        authenticationManager: AuthenticationManager,
        userManager: UserManager,
        product: Product,
        discount: Discount?
    ) {
        self._viewModel = .init(
            wrappedValue: AddToFavoriteViewModel(
                authenticationManager: authenticationManager,
                userManager: userManager,
                product: product,
                discount: discount
            )
        )
    }
    var body: some View {
        Button {
            withAnimation {
                viewModel.favoriteProducts.map { $0.id }.contains(viewModel.product.id)
                ? viewModel.removeFavoriteProduct()
                : viewModel.addFavoriteProduct()
            }
        } label: {
            Image(systemName: viewModel.favoriteProducts.map { $0.id }.contains(viewModel.product.id) ? "heart.fill" : "heart")
                .foregroundColor(viewModel.favoriteProducts.map { $0.id }.contains(viewModel.product.id) ? .red : .gray)
                .frame(width: 40, height: 40)
                .background(Color.white)
        }
        .cornerRadius(20)
        .shadow(
            color: RCValues.shared.color(forKey: .secondary),
            radius: 2, x: 1, y: 1
        )
    }
}

struct AddToFavoriteButtonView_Previews: PreviewProvider {
    static var previews: some View {
        AddToFavoriteButtonView(
            authenticationManager: AuthenticationManager(),
            userManager: UserManager(),
            product: ProductDatabase.products[0],
            discount: Discount(
                id: ProductDatabase.products[0].id,
                discountPercent: 50)
        )
    }
}
