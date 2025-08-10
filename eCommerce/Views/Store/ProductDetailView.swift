//
//  ProductDetailView.swift
//  eCommerce
//
//  Created by Imen Ksouri on 02/07/2023.
//

import SwiftUI
import FirebaseAnalytics

struct ProductDetailView: View {
    private let authenticationManager: AuthenticationManager
    private let userManager: UserManager
    let product: Product
    let discount: Discount?
    @State private var selectedVariant: Int = 0
    @State private var selectedSize: Int?
    @State private var quantity: Int = 1

    init(
        authenticationManager: AuthenticationManager,
        userManager: UserManager,
        product: Product,
        discount: Discount?
    ) {
        self.authenticationManager = authenticationManager
        self.userManager = userManager
        self.product = product
        self.discount = discount
    }

    var body: some View {
        ScrollView(showsIndicators: false) {
            ZStack(alignment: .bottom) {
                Color.white
                VStack {
                    AsyncImage(url: URL(string: product.variants.map { $0.imageUrl }[selectedVariant])) { image in
                        image
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(10)
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: UIScreen.main.bounds.width, height: 400)
                    .overlay(alignment: .topTrailing) {
                        AddToFavoriteButtonView(
                            authenticationManager: authenticationManager,
                            userManager: userManager,
                            product: product,
                            discount: discount
                        )
                        .padding([.top, .trailing])

                    }
                    .overlay(alignment: .topLeading) {
                        if let discount {
                            DiscountTagView(discount: discount)
                        } else if product.isNewIn ?? false {
                            NewInTagView()
                        }
                    }
                    VStack(alignment: .leading) {
                        VStack(alignment: .leading) {
                            HStack(spacing: 0) {
                                Text("Color: ")
                                Text(product.variants.map { $0.colorName }[selectedVariant])
                                    .fontWeight(.bold)
                            }
                            .font(.footnote)
                            
                            HStack(spacing: 5) {
                                ForEach(product.variants.map { $0.imageUrl }, id: \.self) { url in
                                    ProductVariantsImageView(
                                        url: url,
                                        opacity: selectedVariant == getVariantIndex(url: url) ? 1 : 0
                                    ) {
                                        selectedVariant = getVariantIndex(url: url)
                                    }
                                }
                                Spacer()
                            }
                        }

                        VStack(alignment: .leading) {
                            Text(product.brand)
                                .font(.custom(AppFont.lightFont, size: 15))
                            
                            Text(product.name)
                                .font(.custom(AppFont.boldFont, size: 15))
                            
                            ProductPriceView(
                                product: product,
                                discount: discount
                            )
                            .padding(.vertical, 1)
                        }

                        ScrollView(.horizontal, showsIndicators: false) {
                            VStack(alignment: .leading) {
                                Text("Select your size")
                                    .font(.custom(AppFont.semiBoldFont, size: 13))
                                    .padding(.top)
                                    .padding(.bottom, 1)
                                
                                HStack(spacing: 10) {
                                    ForEach(product.sizes, id: \.self) { size in
                                        SelectSizeView(
                                            size: size,
                                            background: selectedSize == getSizeIndex(size: size)
                                            ? .black
                                            : RCValues.shared.color(forKey: .secondary),
                                            foregroundColor: selectedSize == getSizeIndex(size: size)
                                            ? .white
                                            : RCValues.shared.color(forKey: .primary)
                                        ) {
                                            selectedSize = getSizeIndex(size: size)
                                        }
                                    }
                                }
                            }
                        }

                        DisclosureGroup("Description") {
                            HStack {
                                Text(product.description)
                                    .font(.custom(AppFont.lightFont, size: 13))
                                Spacer()
                            }
                        }
                        .padding(.vertical)
                        .padding(.bottom)
                        .font(.custom(AppFont.semiBoldFont, size: 13))

                        Spacer()

                    }
                    .foregroundColor(
                        RCValues.shared.color(forKey: .primary)
                    )
                    .padding()
                    .background(.white)
                    .cornerRadius(20)
                    .offset(y: -30)
                }
                AddToCartButtonView(
                    authenticationManager: authenticationManager,
                    userManager: userManager,
                    product: product,
                    discount: discount,
                    selectedVariant: selectedVariant,
                    selectedSize: selectedSize,
                    quantity: quantity
                )
            }
        }
        .onAppear {
            logEventViewItem()
        }
    }

    func getVariantIndex(url : String) -> Int {
        let urls = product.variants.map { $0.imageUrl }
        guard let index = urls.firstIndex(of: url) else {
            return 0
        }
        return index
    }

    func getSizeIndex(size : String) -> Int {
        let sizes = product.sizes
        guard let index = sizes.firstIndex(of: size) else {
            return 0
        }
        return index
    }

    func logEventViewItem() {
        FirebaseAnalytics.Analytics.logEvent(AnalyticsEventViewItem, parameters: [
            AnalyticsParameterItemBrand: product.brand,
            AnalyticsParameterItemName: product.name,
            AnalyticsParameterItemCategory: product.category,
            AnalyticsParameterItemCategory2: product.subCategory,
            AnalyticsParameterPrice: product.price,
            AnalyticsParameterCurrency: "USD",
            AnalyticsParameterDiscount: discount?.discountPercent ?? 0
        ])
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView(
            authenticationManager: AuthenticationManager(),
            userManager: UserManager(),
            product: ProductDatabase.products[0],
            discount: Discount(
                id: ProductDatabase.products[0].id,
                discountPercent: 50)
        )
    }
}
