//
//  CartView.swift
//  eCommerce
//
//  Created by Imen Ksouri on 21/06/2023.
//

import SwiftUI
import FirebaseAnalytics

struct CartView: View {
    @State private var didAppear = false
    @State private var isShowingDetail = false
    @State private var isCheckingOut = false
    @State private var selectedProduct: Product?
    @State private var selectedProductDiscount: Discount?
    @ObservedObject var viewModel: CartViewModel
    @ObservedObject var cartItemViewModel: CartItemViewModel
    @ObservedObject var checkoutViewModel: CheckoutViewModel

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
                    ScrollView {
                        ForEach(viewModel.cartItems.sorted { $0.dateAdded > $1.dateAdded }) { item in
                            CartItemRowView(item: item) {
                                viewModel.removeFromCart(item: item)
                                FirebaseAnalytics.Analytics.logEvent(AnalyticsEventRemoveFromCart, parameters: [
                                    AnalyticsParameterItemBrand: item.brand,
                                    AnalyticsParameterItemName: item.name,
                                    AnalyticsParameterItemVariant: item.colorName,
                                    AnalyticsParameterQuantity: item.quantity,
                                    AnalyticsParameterPrice: item.price,
                                    AnalyticsParameterDiscount: item.discountPercent,
                                    AnalyticsParameterCurrency: "USD",
                                ])
                            } decreaseQuantityAction: {
                                viewModel.decreaseQuantity(item: item)
                                FirebaseAnalytics.Analytics.logEvent(AnalyticsEventRemoveFromCart, parameters: [
                                    AnalyticsParameterItemBrand: item.brand,
                                    AnalyticsParameterItemName: item.name,
                                    AnalyticsParameterItemVariant: item.colorName,
                                    AnalyticsParameterQuantity: 1,
                                    AnalyticsParameterPrice: item.price,
                                    AnalyticsParameterDiscount: item.discountPercent,
                                    AnalyticsParameterCurrency: "USD",
                                ])
                            } increaseQuantityAction: {
                                viewModel.increaseQuantity(item: item)
                                FirebaseAnalytics.Analytics.logEvent(AnalyticsEventAddToCart, parameters: [
                                    AnalyticsParameterItemBrand: item.brand,
                                    AnalyticsParameterItemName: item.name,
                                    AnalyticsParameterItemVariant: item.colorName,
                                    AnalyticsParameterQuantity: 1,
                                    AnalyticsParameterPrice: item.price,
                                    AnalyticsParameterDiscount: item.discountPercent,
                                    AnalyticsParameterCurrency: "USD",
                                ])
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
                            .navigationDestination(isPresented: $isShowingDetail, destination: {
                                if let selectedProduct {
                                    ProductDetailView(
                                        product: selectedProduct,
                                        discount: selectedProductDiscount,
                                        viewModel: cartItemViewModel)
                                }
                            })
                            Divider()
                        }
                        
                    }
                    VStack {
                        CartAmountView(cartItems: viewModel.cartItems,
                                       cart: viewModel.cart)
                        CheckoutButtonView {
                            isCheckingOut.toggle()
                            FirebaseAnalytics.Analytics.logEvent(AnalyticsEventBeginCheckout, parameters: [
                                AnalyticsParameterQuantity: viewModel.cartItems.map { $0.quantity }.reduce(0, +),
                                AnalyticsParameterPrice: viewModel.cart?.totalAmount ?? 0,
                                AnalyticsParameterDiscount: viewModel.cart?.discountAmount ?? 0,
                                AnalyticsParameterCurrency: "USD",
                            ])
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
                    viewModel.getDiscounts()
                }
                FirebaseAnalytics.Analytics.logEvent(AnalyticsEventViewCart, parameters: [
                    AnalyticsParameterQuantity: viewModel.cartItems.map { $0.quantity }.reduce(0, +),
                    AnalyticsParameterPrice: viewModel.cart?.totalAmount ?? 0,
                    AnalyticsParameterDiscount: viewModel.cart?.discountAmount ?? 0,
                    AnalyticsParameterCurrency: "USD",
                ])
            }
            .fullScreenCover(isPresented: $isCheckingOut) {
                NavigationStack {
                    CheckoutView(
                        numberOfArticles: viewModel.cartItems.map { $0.quantity }.reduce(0, +),
                        totalAmount: viewModel.cart?.totalAmount ?? 0,
                        isCheckingOut: $isCheckingOut,
                        viewModel: checkoutViewModel)
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
                    viewModel: CartViewModel(
                        authenticationManager: AuthenticationManager(),
                        userManager: UserManager(),
                        productManager: ProductManager(),
                        discountProductManager: DiscountProductManager()),
                    cartItemViewModel: CartItemViewModel(
                        authenticationManager: AuthenticationManager(),
                        userManager: UserManager()),
                    checkoutViewModel: CheckoutViewModel(
                        authenticationManager: AuthenticationManager(),
                        userManager: UserManager(),
                        paymentManager: PaymentManager()))
            }
        }
    }
}
