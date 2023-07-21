//
//  HomeView.swift
//  eCommerce
//
//  Created by Imen Ksouri on 19/06/2023.
//

import SwiftUI

struct HomeView: View {
    var featureImages = ["feature1", "feature2", "feature3"]
    var productManager: ProductManager
    var discountProductManager: DiscountProductManager
    @ObservedObject var viewModel: HomeViewModel
    @ObservedObject var favoriteProductsViewModel: FavoriteProductsViewModel
    @ObservedObject var cartItemViewModel: CartItemViewModel

    var body: some View {
        NavigationStack {
            Rectangle()
                .foregroundColor(RCValues.shared
                    .color(forKey: .tabBarBackground))
                .ignoresSafeArea()
                .frame(height: 25)
            List {
                PageView(pages: featureImages.map { PageFeatureImage(featureImage: $0) })
                    .aspectRatio(3 / 2, contentMode: .fit)
                    .listRowInsets(EdgeInsets())
                    .padding(.bottom, 8)
                VStack(alignment: .leading) {
                    HStack {
                        Text("SUMMER SALE")
                            .font(.custom(AppFont.extraBoldFont, size: 18))
                        Spacer()
                        Button {
                            viewModel.showDiscountedProducts.toggle()
                        } label: {
                            Text("Show All")
                                .font(.custom(AppFont.lightFont, size: 18))
                        }
                        .buttonStyle(.plain)
                        .navigationDestination(isPresented: $viewModel.showDiscountedProducts) {
                            ProductsListView(
                                productManager: productManager,
                                discountProductManager: discountProductManager,
                                category: nil,
                                subCategory: nil,
                                showDiscountedProducts: viewModel.showDiscountedProducts,
                                showNewInProducts: viewModel.showNewInProducts,
                                favoriteProductsViewModel: favoriteProductsViewModel,
                                cartItemViewModel: cartItemViewModel)
                        }
                    }
                    .foregroundColor(RCValues.shared
                        .color(forKey: .primary))
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(alignment: .top, spacing: 15) {
                            ForEach(viewModel.featuredDiscountedProducts) { product in
                                NavigationLink {
                                    ProductDetailView(
                                        product: product,
                                        discount: viewModel.getDiscountForId(product.id),
                                        viewModel: cartItemViewModel)
                                } label: {
                                    FeaturedProductCellView(
                                        product: product,
                                        discount: viewModel.getDiscountForId(product.id))
                                }
                                .buttonStyle(PlainButtonStyle())
                            }
                        }
                    }
                    .frame(height: 280)
                    .padding(.horizontal)
                }
                .listRowSeparator(.hidden)
                VStack(alignment: .leading) {
                    HStack {
                        Text("NEW ARRIVALS")
                            .font(.custom(AppFont.extraBoldFont, size: 18))
                        Spacer()
                        Button {
                            viewModel.showNewInProducts.toggle()
                        } label: {
                            Text("Show All")
                                .font(.custom(AppFont.lightFont, size: 18))
                        }
                        .buttonStyle(.plain)
                        .navigationDestination(isPresented: $viewModel.showNewInProducts) {
                            ProductsListView(
                                productManager: productManager,
                                discountProductManager: discountProductManager,
                                category: nil,
                                subCategory: nil,
                                showDiscountedProducts: viewModel.showDiscountedProducts,
                                showNewInProducts: viewModel.showNewInProducts,
                                favoriteProductsViewModel: favoriteProductsViewModel,
                                cartItemViewModel: cartItemViewModel
                            )
                        }
                    }
                    .foregroundColor(RCValues.shared
                        .color(forKey: .primary))
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(alignment: .top, spacing: 15) {
                            ForEach(viewModel.featuredNewInProducts) { product in
                                NavigationLink {
                                    ProductDetailView(
                                        product: product,
                                        discount: viewModel.getDiscountForId(product.id),
                                        viewModel: cartItemViewModel)
                                } label: {
                                    FeaturedProductCellView(
                                        product: product,
                                        discount: viewModel.getDiscountForId(product.id))
                                }
                                .buttonStyle(PlainButtonStyle())
                            }
                        }
                    }
                    .frame(height: 280)
                    .padding(.horizontal)
                }
                .listRowSeparator(.hidden)
            }
            .offset(x: 0, y: -8)
            .listStyle(.inset)
            .onAppear {
                viewModel.getDiscounts()
                viewModel.getFeaturedDiscountedProducts()
                viewModel.getFeaturedNewInProducts()
            }
            .onDisappear {
                viewModel.discounts = []
                viewModel.featuredDiscountedProducts = []
                viewModel.featuredNewInProducts = []
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            HomeView(
                productManager: ProductManager(),
                discountProductManager: DiscountProductManager(),
                viewModel: HomeViewModel(
                    authenticationManager: AuthenticationManager(),
                    productManager: ProductManager(),
                    discountProductManager: DiscountProductManager()),
                favoriteProductsViewModel: FavoriteProductsViewModel(
                    authenticationManager: AuthenticationManager(),
                    userManager: UserManager(),
                    productManager: ProductManager(),
                    discountProductManager: DiscountProductManager()),
                cartItemViewModel: CartItemViewModel(
                    authenticationManager: AuthenticationManager(),
                    userManager: UserManager()))
        }
    }
}
