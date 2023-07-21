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
    @Binding var showAuthentication: Bool
    @State private var currentTab: Tab = .home
    var productManager: ProductManager
    var discountProductManager: DiscountProductManager
    @StateObject var homeViewModel: HomeViewModel
    @StateObject var favoriteProductsViewModel: FavoriteProductsViewModel
    @StateObject var cartItemViewModel: CartItemViewModel
    @StateObject var cartViewModel: CartViewModel
    @StateObject var checkoutViewModel: CheckoutViewModel
    @StateObject var profileViewModel: ProfileViewModel
    @StateObject var ordersViewModel: OrdersViewModel

    @Namespace var animation

    init(showAuthentication: Binding<Bool>,
         authenticationManager: AuthenticationManager,
         userManager: UserManager,
         productManager: ProductManager,
         discountProductManager: DiscountProductManager,
         paymentManager: PaymentManager) {
        self._showAuthentication = showAuthentication
        self.productManager = productManager
        self.discountProductManager = discountProductManager
        self._homeViewModel = .init(wrappedValue: HomeViewModel(
            authenticationManager: authenticationManager,
            productManager: productManager,
            discountProductManager: discountProductManager))
        self._favoriteProductsViewModel = .init(wrappedValue: FavoriteProductsViewModel(
            authenticationManager: authenticationManager,
            userManager: userManager,
            productManager: productManager,
            discountProductManager: discountProductManager))
        self._cartItemViewModel = .init(wrappedValue: CartItemViewModel(
            authenticationManager: authenticationManager,
            userManager: userManager))
        self._cartViewModel = .init(wrappedValue: CartViewModel(
            authenticationManager: authenticationManager,
            userManager: userManager,
            productManager: productManager,
            discountProductManager: discountProductManager))
        self._checkoutViewModel = .init(wrappedValue: CheckoutViewModel(
            authenticationManager: authenticationManager,
            userManager: userManager,
            paymentManager: paymentManager))
        self._profileViewModel = .init(wrappedValue: ProfileViewModel(
            authenticationManager: authenticationManager,
            userManager: userManager))
        self._ordersViewModel = .init(wrappedValue: OrdersViewModel(
            authenticationManager: authenticationManager,
            userManager: userManager))
    }

    var body: some View {
        TabView(selection: $currentTab) {
            HomeView(
                productManager: productManager,
                discountProductManager: discountProductManager,
                viewModel: homeViewModel,
                favoriteProductsViewModel: favoriteProductsViewModel,
                cartItemViewModel: cartItemViewModel)
            .tag(Tab.home)

            StoreView(
                productManager: productManager,
                discountProductManager: discountProductManager,
                favoriteProductsViewModel: favoriteProductsViewModel,
                cartItemViewModel: cartItemViewModel)
            .tag(Tab.store)

            FavoritesView(
                productManager: productManager,
                discountProductManager: discountProductManager,
                viewModel: favoriteProductsViewModel,
                cartItemViewModel: cartItemViewModel)
            .tag(Tab.favorites)

            CartView(
                viewModel: cartViewModel,
                cartItemViewModel: cartItemViewModel,
                checkoutViewModel: checkoutViewModel)
            .tag(Tab.cart)

            ProfileView(
                showAuthentication: $showAuthentication,
                viewModel: profileViewModel,
                ordersViewModel: ordersViewModel)
            .tag(Tab.profile)
        }
        .overlay (
            HStack(spacing: 0) {
                ForEach(Tab.allCases, id: \.self) { tab in
                    TabButton(currentTab: $currentTab, animation: animation, tab: tab)
                }
                .padding(.vertical)
                .padding(.bottom, getSafeArea().bottom == 0 ? -3 : (getSafeArea().bottom - 8))
                .background(RCValues.shared
                    .color(forKey: .tabBarBackground))
            }
            ,alignment: .bottom
        )
        .ignoresSafeArea(.all, edges: .bottom)
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView(
            showAuthentication: .constant(false),
            authenticationManager: AuthenticationManager(),
            userManager: UserManager(),
            productManager: ProductManager(),
            discountProductManager: DiscountProductManager(),
            paymentManager: PaymentManager())
    }
}
