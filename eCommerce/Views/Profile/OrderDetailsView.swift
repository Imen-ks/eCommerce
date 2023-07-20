//
//  OrderDetailsView.swift
//  eCommerce
//
//  Created by Imen Ksouri on 15/07/2023.
//

import SwiftUI

struct OrderDetailsView: View {
    let order: Order
    @ObservedObject var viewModel: OrdersViewModel

    var body: some View {
        ScrollView {
            if let shippingAddress = viewModel.orderShippingAddress {
                OrderDetailPersonnalInfoSectionView(
                    firstName: viewModel.firstName,
                    lastName: viewModel.lastName,
                    order: order,
                    shippingAddress: shippingAddress)
                Section {
                    ForEach(viewModel.orderItems) { item in
                        OrderItemRowView(item: item)
                        Divider()
                    }
                    OrderAmountView(order: order, orderItems: viewModel.orderItems)
                }
                .padding(.horizontal)
            }
        }
        .navigationTitle("N° \(order.id)")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            viewModel.getUser()
            viewModel.getProfile()
            viewModel.getShippingAddressForOrder(orderId: order.id)
            viewModel.getAllOrderItemsForOrder(orderId: order.id)
        }
    }
}

struct OrderDetailsView_Previews: PreviewProvider {
    static var order = Order(
        id: "GT69F40HK4Z5",
        userId: UUID().uuidString,
        freightCosts: 0,
        discountAmount: 22.5,
        totalAmount: 221.5,
        numberOfArticles: 2,
        dateCreated: Date())
    static var previews: some View {
        NavigationStack {
            OrderDetailsView(
                order: order,
                viewModel: OrdersViewModel(
                    authenticationManager: AuthenticationManager(),
                    userManager: UserManager()))
        }
    }
}
