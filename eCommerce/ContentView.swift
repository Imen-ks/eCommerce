//
//  ContentView.swift
//  eCommerce
//
//  Created by Imen Ksouri on 13/06/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var showAuthentication = false
    private var authenticationManager = AuthenticationManager()
    private var userManager = UserManager()
    private var productManager = ProductManager()
    private var discountProductManager = DiscountProductManager()
    private var paymentManager = PaymentManager()

    var body: some View {
        ZStack {
            if !showAuthentication {
                TabBarView(
                    showAuthentication: $showAuthentication,
                    authenticationManager: authenticationManager,
                    userManager: userManager,
                    productManager: productManager,
                    discountProductManager: discountProductManager,
                    paymentManager: paymentManager)
            }
        }
        .onAppear {
            let user = authenticationManager.user
            self.showAuthentication = user == nil
        }
        .fullScreenCover(isPresented: $showAuthentication) {
            SignInView(
                showAuthentication: $showAuthentication,
                authenticationManager: authenticationManager,
                userManager: userManager,
                paymentManager: paymentManager)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
