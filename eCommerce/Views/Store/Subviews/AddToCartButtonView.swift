//
//  AddToCartButtonView.swift
//  eCommerce
//
//  Created by Imen Ksouri on 05/07/2023.
//

import SwiftUI

struct AddToCartButtonView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var showAlert = false
    @ObservedObject var viewModel: AddToCartViewModel

    init(
        authenticationManager: AuthenticationManager,
        userManager: UserManager,
        product: Product,
        discount: Discount?,
        selectedVariant: Int,
        selectedSize: Int?,
        quantity: Int
    ) {
        self._viewModel = .init(
            wrappedValue: AddToCartViewModel(
                authenticationManager: authenticationManager,
                userManager: userManager,
                product: product,
                discount: discount,
                selectedVariant: selectedVariant,
                selectedSize: selectedSize,
                quantity: quantity
            )
        )
    }

    var body: some View {
        Button {
            withAnimation {
                showAlert.toggle()
            }
        } label: {
            VStack {
                Image(systemName: "bag")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20)
                    .padding()
                    .background(.black)
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .mask(Circle())
                Text("Add to Cart")
                    .font(.custom(AppFont.regularFont, size: 10))
                    .foregroundColor(
                        RCValues.shared.color(forKey: .primary)
                    )
            }
        }
        .alert(isPresented: $showAlert) {
            Alert(title: Text(viewModel.selectedSize == nil ? "Missing information" : "Information"), message: Text(viewModel.selectedSize == nil ? "Please select your size" : "This item has been added to your cart"), dismissButton: .default(Text("OK")) {
                if viewModel.selectedSize != nil {
                    viewModel.addToCart()
                    dismiss()
                }
            })
        }
    }
}

struct AddToCartButtonView_Previews: PreviewProvider {
    static var previews: some View {
        AddToCartButtonView(
            authenticationManager: AuthenticationManager(),
            userManager: UserManager(),
            product: ProductDatabase.products[0],
            discount: Discount(
                id: ProductDatabase.products[0].id,
                discountPercent: 50),
            selectedVariant: 0,
            selectedSize: nil,
            quantity: 1
        )
    }
}
