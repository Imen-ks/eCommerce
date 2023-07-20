//
//  ProductVariantsImageView.swift
//  eCommerce
//
//  Created by Imen Ksouri on 05/07/2023.
//

import SwiftUI

struct ProductVariantsImageView: View {
    let url: String
    var opacity: Double
    var action: () -> Void
    var body: some View {
        AsyncImage(url: URL(string: url)) { image in
            image
                .resizable()
                .scaledToFit()
                .overlay(content: {
                    Rectangle()
                        .stroke(.black, lineWidth: 2)
                        .opacity(opacity)
                })
                .onTapGesture {
                    action()
                }
        } placeholder: {
            ProgressView()
        }
        .frame(width: UIScreen.main.bounds.width / 5, height: 100)
    }
}

struct ProductVariantsImageView_Previews: PreviewProvider {
    static var previews: some View {
        ProductVariantsImageView(
            url: ProductDatabase.products[0].variants.map { $0.imageUrl }.first!,
            opacity: 1) {}
    }
}
