//
//  SelectSizeView.swift
//  eCommerce
//
//  Created by Imen Ksouri on 05/07/2023.
//

import SwiftUI

struct SelectSizeView: View {
    let size: String
    let background: Color
    let foregroundColor: Color
    let action: () -> Void

    var body: some View {
        Text(size)
            .font(.custom(AppFont.semiBoldFont, size: 12))
            .frame(width: UIScreen.main.bounds.width / 14)
            .padding(3)
            .background(background)
            .foregroundColor(foregroundColor)
            .cornerRadius(10)
            .onTapGesture {
                action()
            }
    }
}

struct SelectSizeView_Previews: PreviewProvider {
    static var previews: some View {
        SelectSizeView(size: "M",
                       background: RCValues.shared
            .color(forKey: .secondary),
                       foregroundColor: RCValues.shared
            .color(forKey: .primary)) {}
    }
}
