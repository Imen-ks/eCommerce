//
//  CheckoutView.swift
//  eCommerce
//
//  Created by Imen Ksouri on 13/07/2023.
//

import SwiftUI
import StripePaymentSheet

struct CheckoutView: View {
    let numberOfArticles: Int
    let totalAmount: Double
    @Binding var isCheckingOut: Bool
    @State private var didAppear = false
    @State private var isAddingAddress = false
    @State private var isLoading = false
    @ObservedObject var viewModel: CheckoutViewModel

    init(authenticationManager: AuthenticationManager,
        userManager: UserManager,
        paymentManager: PaymentManager,
        numberOfArticles: Int,
        totalAmount: Double,
        isCheckingOut: Binding<Bool>) {
        self.numberOfArticles = numberOfArticles
        self.totalAmount = totalAmount
        self._isCheckingOut = isCheckingOut
        self._viewModel = .init(
            wrappedValue: CheckoutViewModel(
                authenticationManager: authenticationManager,
                userManager: userManager,
                paymentManager: paymentManager
            )
        )
    }

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
                viewModel.logEventAddShippingInfo()
            } removeAction: {
                viewModel.removeShippingAddress()
                isAddingAddress.toggle()
            }
            .disabled(viewModel.paymentIsProcessed)
            .offset(y: -8)
            .padding(.bottom)
            
            if !isLoading && !viewModel.paymentIsProcessed {
                CheckoutContinueButtonView(
                    disabled: viewModel.shippingAddress == nil) {
                    viewModel.preparePaymentSheet()
                    isLoading.toggle()
                }
            }
            
            if viewModel.paymentSheet != nil {
                Button {
                    viewModel.presentPaymentSheet()
                } label: {
                    CheckoutPaymentButtonContentView(
                        text: viewModel.paymentIsCompleted ? "Payment complete ✓" : "Proceed with Payment",
                        background: viewModel.paymentIsCompleted ? .green : viewModel.paymentIsProcessed ? .gray : .black)
                }
                .disabled(viewModel.paymentIsProcessed)
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
        ViewControllerResolver { vc in
            viewModel.viewController = vc
        }
        .frame(width: 0, height: 0)
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            CheckoutView(
                authenticationManager: AuthenticationManager(),
                userManager: UserManager(),
                paymentManager: PaymentManager(),
                numberOfArticles: 2,
                totalAmount: 169,
                isCheckingOut: .constant(false)
            )
        }
    }
}

// ViewController for presenting the Payment Sheet
struct ViewControllerResolver: UIViewControllerRepresentable {
    var onResolve: (UIViewController) -> Void

    func makeUIViewController(context: Context) -> ResolverViewController {
        ResolverViewController(onResolve: onResolve)
    }

    func updateUIViewController(_ uiViewController: ResolverViewController, context: Context) {}

    class ResolverViewController: UIViewController {
        let onResolve: (UIViewController) -> Void

        init(onResolve: @escaping (UIViewController) -> Void) {
            self.onResolve = onResolve
            super.init(nibName: nil, bundle: nil)
        }

        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }

        override func viewDidAppear(_ animated: Bool) {
            super.viewDidAppear(animated)
            onResolve(self)
        }
    }
}
