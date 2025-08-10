//
//  TabBarView.swift
//  eCommerce
//
//  Created by Imen Ksouri on 21/06/2023.
//

import SwiftUI

enum Tab: String, CaseIterable {
    case home = "house"
    case store = "cart"
    case favorites = "heart"
    case cart = "bag"
    case profile = "person"

    var tabName: String {
        switch self {
        case .home: return "Home"
        case .store: return "Store"
        case .favorites: return "Favorites"
        case .cart: return "Cart"
        case .profile: return "Profile"
        }
    }
}

struct TabBarView: View {
    private let authenticationManager: AuthenticationManager
    private let userManager: UserManager
    private let productManager: ProductManager
    private let discountProductManager: DiscountProductManager
    private let paymentManager: PaymentManager
    @Binding var showAuthentication: Bool
    @State private var currentTab: Tab = .home

    @Namespace var animation

    init(
        authenticationManager: AuthenticationManager,
        userManager: UserManager,
        productManager: ProductManager,
        discountProductManager: DiscountProductManager,
        paymentManager: PaymentManager,
        showAuthentication: Binding<Bool>
    ) {
        self.authenticationManager = authenticationManager
        self.userManager = userManager
        self.productManager = productManager
        self.discountProductManager = discountProductManager
        self.paymentManager = paymentManager
        self._showAuthentication = showAuthentication
    }

    var body: some View {
        TabView(selection: $currentTab) {
            HomeView(
                authenticationManager: authenticationManager,
                userManager: userManager,
                productManager: productManager,
                discountProductManager: discountProductManager
            ).tag(Tab.home)

            StoreView(
                authenticationManager: authenticationManager,
                userManager: userManager,
                productManager: productManager,
                discountProductManager: discountProductManager
            ).tag(Tab.store)

            FavoritesView(
                authenticationManager: authenticationManager,
                userManager: userManager,
                productManager: productManager,
                discountProductManager: discountProductManager
            ).tag(Tab.favorites)

            CartView(
                authenticationManager: authenticationManager,
                userManager: userManager,
                productManager: productManager,
                discountProductManager: discountProductManager,
                paymentManager: paymentManager
            ).tag(Tab.cart)

            ProfileView(
                authenticationManager: authenticationManager,
                userManager: userManager,
                showAuthentication: $showAuthentication
            ).tag(Tab.profile)
        }
        .overlay (
            HStack(spacing: 0) {
                ForEach(Tab.allCases, id: \.self) { tab in
                    TabButton(
                        currentTab: $currentTab,
                        animation: animation,
                        tab: tab
                    )
                }
                .padding(.vertical)
                .padding(
                    .bottom,
                    getSafeArea().bottom == 0
                    ? -3
                    : (getSafeArea().bottom - 8)
                )
                .background(
                    RCValues.shared.color(forKey: .tabBarBackground)
                )
            }
            ,alignment: .bottom
        )
        .ignoresSafeArea(.all, edges: .bottom)
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView(
            authenticationManager: AuthenticationManager(),
            userManager: UserManager(),
            productManager: ProductManager(),
            discountProductManager: DiscountProductManager(),
            paymentManager: PaymentManager(),
            showAuthentication: .constant(false)
        )
    }
}
