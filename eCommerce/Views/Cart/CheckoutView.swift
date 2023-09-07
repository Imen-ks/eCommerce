//
//  CheckoutView.swift
//  eCommerce
//
//  Created by Imen Ksouri on 13/07/2023.
//

import SwiftUI
import StripePaymentSheet
import FirebaseAnalytics

struct CheckoutView: View {
    let numberOfArticles: Int
    let totalAmount: Double
    @Binding var isCheckingOut: Bool
    @State private var didAppear = false
    @State private var isAddingAddress = false
    @State private var isLoading = false
    @State private var paymentIsProcessed = false
    @ObservedObject var viewModel: CheckoutViewModel

    var body: some View {
        ScrollView {
            CheckoutCartSumaryView(
                numberOfArticles: viewModel.numberOfArticles,
                totalAmount: viewModel.totalAmount)

            ShippingAddressSectionView(
                fields:
                    [
                        (label: "Street Number", value: $viewModel.streetNumber),
                        (label: "Street Name", value: $viewModel.streetName),
                        (label: "Postal Code", value: $viewModel.postalCode),
                        (label: "Town", value: $viewModel.town),
                        (label: "Country", value: $viewModel.country)
                    ],
                isAddingAddress: $isAddingAddress,
                shippingAddress: viewModel.shippingAddress
            ) {
                viewModel.addShippingAddress()
                isAddingAddress.toggle()
                FirebaseAnalytics.Analytics.logEvent(AnalyticsEventAddShippingInfo, parameters: [
                    AnalyticsParameterLocation: "\(viewModel.town), \(viewModel.country)"
                ])
            } removeAction: {
                viewModel.removeShippingAddress()
                isAddingAddress.toggle()
            }
            .disabled(paymentIsProcessed)
            .offset(y: -8)
            .padding(.bottom)
            
            if !isLoading && !paymentIsProcessed {
                CheckoutContinueButtonView(
                    disabled: viewModel.shippingAddress == nil) {
                    viewModel.preparePaymentSheet()
                    isLoading.toggle()
                }
            }
            
            if let paymentSheet = viewModel.paymentSheet {
                PaymentSheet.PaymentButton(
                    paymentSheet: paymentSheet) { result in
                        viewModel.paymentResult = result
                        paymentIsProcessed.toggle()
                        if let result = viewModel.paymentResult {
                            switch result {
                            case .completed:
                                viewModel.paymentIsCompleted = true
                                viewModel.clearCart()
                                viewModel.addOrder()
                                FirebaseAnalytics.Analytics.logEvent(AnalyticsEventPurchase, parameters: [
                                  AnalyticsParameterPaymentType: "card",
                                  AnalyticsParameterPrice: viewModel.totalAmount,
                                  AnalyticsParameterSuccess: "1",
                                  AnalyticsParameterCurrency: "USD"
                                ])
                            case .failed(let error):
                                viewModel.paymentIsFailed = true
                                viewModel.error = error.localizedDescription
                                FirebaseAnalytics.Analytics.logEvent(AnalyticsEventPurchase, parameters: [
                                  AnalyticsParameterPaymentType: "card",
                                  AnalyticsParameterPrice: viewModel.totalAmount,
                                  AnalyticsParameterSuccess: "0",
                                  AnalyticsParameterCurrency: "USD"
                                ])
                            case .canceled:
                                viewModel.paymentIsCancelled = true
                                FirebaseAnalytics.Analytics.logEvent(AnalyticsEventPurchase, parameters: [
                                  AnalyticsParameterPaymentType: "card",
                                  AnalyticsParameterPrice: viewModel.totalAmount,
                                  AnalyticsParameterSuccess: "0",
                                  AnalyticsParameterCurrency: "USD"
                                ])
                            }
                        }
                } content: {
                    CheckoutPaymentButtonContentView(
                        text: viewModel.paymentIsCompleted ? "Payment complete ✓" : "Proceed with Payment",
                        background: viewModel.paymentIsCompleted ? .green : paymentIsProcessed ? .gray : .black)
                }
                .disabled(paymentIsProcessed)
            } else if isLoading {
                VStack {
                    Text("Loading…")
                    ProgressView()
                }
            }

            if viewModel.paymentIsCompleted {
                OrderConfirmationView(orderId: viewModel.orderId)
            } else if viewModel.paymentIsFailed {
                Text("Payment failed: \(viewModel.error)")
                    .padding(.horizontal, 30)
                    .padding(.top)
            } else if viewModel.paymentIsCancelled {
                Text("Payment canceled.")
                    .foregroundColor(.red)
                    .padding(.top)
            }
        }
        .navigationTitle("Checkout")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    isCheckingOut.toggle()
                } label: {
                    Image(systemName: "xmark")
                }
            }
        }
        .onAppear {
            if !didAppear {
                viewModel.addListenerForCart()
                viewModel.addListenerForCartItems()
                viewModel.addListenerForShippingAddress()
                didAppear = true
            }
            viewModel.getUser()
            viewModel.getProfile()
            viewModel.numberOfArticles = self.numberOfArticles
            viewModel.totalAmount = self.totalAmount
            viewModel.paymentIsCompleted = false
            viewModel.paymentIsFailed = false
            viewModel.paymentIsCancelled = false
            viewModel.paymentSheet = nil
            viewModel.paymentResult = nil
        }
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            CheckoutView(
                numberOfArticles: 2,
                totalAmount: 169,
                isCheckingOut: .constant(false),
                viewModel: CheckoutViewModel(
                    authenticationManager: AuthenticationManager(),
                    userManager: UserManager(),
                    paymentManager: PaymentManager()))
        }
    }
}
