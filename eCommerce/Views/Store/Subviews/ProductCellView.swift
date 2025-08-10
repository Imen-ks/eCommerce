//
//  ProductCellView.swift
//  eCommerce
//
//  Created by Imen Ksouri on 30/06/2023.
//

import SwiftUI

struct ProductCellView: View {
    private let authenticationManager: AuthenticationManager
    private let userManager: UserManager
    let product: Product
    let productImageUrl: String?
    let discount: Discount?

    init(
        authenticationManager: AuthenticationManager,
        userManager: UserManager,
        product: Product,
        productImageUrl: String?,
        discount: Discount?
    ) {
        self.authenticationManager = authenticationManager
        self.userManager = userManager
        self.product = product
        self.productImageUrl = productImageUrl
        self.discount = discount
    }

    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.white)
                .shadow(color: .secondary, radius: 2, x: 1, y: 1)
            HStack {
                AsyncImage(url: URL(string: productImageUrl ?? "")) { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: UIScreen.main.bounds.width / 2 - 15, height: 220)
                        .cornerRadius(10)
                } placeholder: {
                    ProgressView()
                }
                .frame(width: UIScreen.main.bounds.width / 2 - 15, height: 220)
                .overlay(alignment: .bottomLeading) {
                    if let discount {
                        DiscountTagView(discount: discount)
                    } else if product.isNewIn ?? false {
                        NewInTagView()
                    }
                }
                
                VStack(alignment: .leading) {
                    Text(product.name)
                        .font(.custom(AppFont.semiBoldFont, size: 15))
                        .lineLimit(2)
                    Text(product.brand)
                        .font(.custom(AppFont.lightFont, size: 15))
                        .padding(.top, 1)
                    ProductVariantsColorView(product: product)
                    Spacer()                    
                    HStack {
                        ProductPriceView(product: product, discount: discount)
                        Spacer()
                        AddToFavoriteButtonView(
                            authenticationManager: authenticationManager,
                            userManager: userManager,
                            product: product,
                            discount: discount
                        )
                    }
                    .padding(.bottom, 10)
                }
                .foregroundColor(
                    RCValues.shared.color(forKey: .primary)
                )
                Spacer()
            }
            .padding(.vertical, 5)
        }
    }
}

struct ProductCellView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView {
            ProductCellView(
                authenticationManager: AuthenticationManager(),
                userManager: UserManager(),
                product: ProductDatabase.products[0],
                productImageUrl: ProductDatabase.products[0].variants.map {
                    $0.imageUrl
                }.first,
                discount: Discount(
                    id: ProductDatabase.products[0].id,
                    discountPercent: 50
                ))
        }
    }
}
