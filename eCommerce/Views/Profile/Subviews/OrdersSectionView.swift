//
//  OrdersSectionView.swift
//  eCommerce
//
//  Created by Imen Ksouri on 07/07/2023.
//

import SwiftUI

struct OrdersSectionView: View {
    let action: () -> Void

    var body: some View {
        Button {
            action()
        } label: {
            HStack {
                Text("MY ORDERS")
                    .font(.custom(AppFont.semiBoldFont, size: 15))
                    .foregroundColor(RCValues.shared
                        .color(forKey: .primary))
                Spacer()
                Image(systemName: "chevron.right")
                    .font(.custom(AppFont.regularFont, size: 20))
                    .foregroundColor(Color(UIColor.secondaryLabel))
            }
        }
        .padding(.horizontal, 20)
    }
}

struct OrdersSectionView_Previews: PreviewProvider {
    static var previews: some View {
        OrdersSectionView() {}
    }
}
