//
//  OrderListView.swift
//  eCommerce
//
//  Created by Imen Ksouri on 15/07/2023.
//

import SwiftUI

struct OrderListView: View {
    @State private var didAppear = false
    @ObservedObject var viewModel: OrdersViewModel

    var body: some View {
        ScrollView {
            ForEach(viewModel.orders.sorted { $0.dateCreated > $1.dateCreated }) { order in
                NavigationLink {
                    OrderDetailsView(
                        order: order,
                        viewModel: viewModel
                    )
                } label: {
                    OrderCellView(order: order)
                }
            }
            .padding(.top)
        }
        .onAppear {
            if !didAppear {
                viewModel.addListenerForOrders()
                didAppear = true
            }
        }
        .background(RCValues.shared
            .color(forKey: .tabBarBackground).opacity(0.5))
        .navigationTitle("Orders")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct OrderListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            OrderListView(
                viewModel: OrdersViewModel(
                    authenticationManager: AuthenticationManager(),
                    userManager: UserManager()))
        }
    }
}
