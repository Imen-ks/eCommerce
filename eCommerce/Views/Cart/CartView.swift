//
//  CartView.swift
//  eCommerce
//
//  Created by Imen Ksouri on 21/06/2023.
//

import SwiftUI

struct CartView: View {
    var authenticationManager: AuthenticationManager
    var userManager: UserManager
    var paymentManager: PaymentManager
    @State private var didAppear = false
    @State private var isShowingDetail = false
    @State private var isCheckingOut = false
    @State private var selectedProduct: Product?
    @State private var selectedProductDiscount: Discount?
    @ObservedObject var viewModel: CartViewModel

    init(authenticationManager: AuthenticationManager,
        userManager: UserManager,
        productManager: ProductManager,
        discountProductManager: DiscountProductManager,
        paymentManager: PaymentManager) {
        self.authenticationManager = authenticationManager
        self.userManager = userManager
        self.paymentManager = paymentManager
        self._viewModel = .init(
            wrappedValue: CartViewModel(
                authenticationManager: authenticationManager,
                userManager: userManager,
                productManager: productManager,
                discountProductManager: discountProductManager
            )
        )
    }

    var body: some View {
        NavigationStack {
            VStack {
                if viewModel.cartItems.isEmpty {
                    VStack(spacing: 0) {
                        Image("cart")
                            .resizable()
                            .scaledToFit()
                            .frame(width: UIScreen.main.bounds.width / 2)
                        Text("Your cart is empty")
                            .font(.custom(AppFont.regularFont, size: 25))
                            .foregroundColor(RCValues.shared
                                .color(forKey: .accent))
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(RCValues.shared
                        .color(forKey: .tabBarBackground).opacity(0.5))
                } else {
                    ScrollView(showsIndicators: false) {
                        ForEach(viewModel.cartItems) { item in
                            CartItemRowView(item: item) {
                                viewModel.removeFromCart(item: item)
                            } decreaseQuantityAction: {
                                viewModel.decreaseQuantity(item: item)
                            } increaseQuantityAction: {
                                viewModel.increaseQuantity(item: item)
                            }
                            .onTapGesture {
                                Task {
                                    self.selectedProduct = try await viewModel.getProductForId(
                                        item.id.split(separator: "-").map { "\($0)" }[0])
                                    self.selectedProductDiscount = viewModel.getDiscountForId(
                                        item.id.split(separator: "-").map { "\($0)" }[0])
                                    isShowingDetail.toggle()
                                }
                            }
                            Divider()
                        }
                    }
                    .navigationDestination(isPresented: $isShowingDetail, destination: {
                        if let selectedProduct {
                            ProductDetailView(
                                authenticationManager: authenticationManager,
                                userManager: userManager,
                                product: selectedProduct,
                                discount: selectedProductDiscount)
                        }
                    })
                    VStack {
                        CartAmountView(cartItems: viewModel.cartItems,
                                       cart: viewModel.cart)
                        CheckoutButtonView {
                            isCheckingOut.toggle()
                            viewModel.logEventBeginCheckout()
                        }
                    }
                    .padding(.bottom)
                }
            }
            .padding(.horizontal, viewModel.cartItems.isEmpty ? 0 : 15)
            .padding(.top, viewModel.cartItems.isEmpty ? 0 : 20)
            .navigationTitle("Cart")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear {
                if !didAppear {
                    viewModel.addListenerForCart()
                    viewModel.addListenerForCartItems()
                    didAppear = true
                }
                viewModel.getDiscounts()
                viewModel.logEventViewCart()
            }
            .fullScreenCover(isPresented: $isCheckingOut) {
                NavigationStack {
                    CheckoutView(
                        authenticationManager: authenticationManager,
                        userManager: userManager,
                        paymentManager: paymentManager,
                        numberOfArticles: viewModel.cartItems.map { $0.quantity
                        }.reduce(0, +),
                        totalAmount: viewModel.cart?.totalAmount ?? 0,
                        isCheckingOut: $isCheckingOut
                    )
                }
            }
        }
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            VStack(spacing: 10) {
                CartView(
                    authenticationManager: AuthenticationManager(),
                    userManager: UserManager(),
                    productManager: ProductManager(),
                    discountProductManager: DiscountProductManager(),
                    paymentManager: PaymentManager()
                )
            }
        }
    }
}
