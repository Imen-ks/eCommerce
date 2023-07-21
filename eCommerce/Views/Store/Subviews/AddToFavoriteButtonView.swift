//
//  AddToFavoriteButtonView.swift
//  eCommerce
//
//  Created by Imen Ksouri on 02/07/2023.
//

import SwiftUI

struct AddToFavoriteButtonView: View {
    let imageName: String
    let color: Color
    var action: () -> Void

    var body: some View {
        Button {
            withAnimation {
                action()
            }
        } label: {
            Image(systemName: imageName)
                .foregroundColor(color)
                .frame(width: 40, height: 40)
                .background(Color.white)
        }
        .cornerRadius(20)
        .shadow(color: RCValues.shared
            .color(forKey: .secondary), radius: 2, x: 1, y: 1)
    }
}

struct AddToFavoriteButtonView_Previews: PreviewProvider {
    static var previews: some View {
        AddToFavoriteButtonView(imageName: "heart.fill", color: .red) {}
    }
}
