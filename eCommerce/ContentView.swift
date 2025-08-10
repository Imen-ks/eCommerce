//
//  ContentView.swift
//  eCommerce
//
//  Created by Imen Ksouri on 13/06/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var showAuthentication = false
    private let authenticationManager = AuthenticationManager()
    private let userManager = UserManager()
    private let productManager = ProductManager()
    private let discountProductManager = DiscountProductManager()
    private let paymentManager = PaymentManager()

    var body: some View {
        ZStack {
            if !showAuthentication {
                TabBarView(
                    authenticationManager: authenticationManager,
                    userManager: userManager,
                    productManager: productManager,
                    discountProductManager: discountProductManager,
                    paymentManager: paymentManager,
                    showAuthentication: $showAuthentication
                )
            }
        }
        .onAppear {
            let user = authenticationManager.user
            self.showAuthentication = user == nil
        }
        .fullScreenCover(isPresented: $showAuthentication) {
            SignInView(
                authenticationManager: authenticationManager,
                userManager: userManager,
                paymentManager: paymentManager,
                showAuthentication: $showAuthentication
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
