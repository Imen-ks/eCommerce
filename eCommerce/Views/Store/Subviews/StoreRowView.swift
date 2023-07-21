//
//  StoreRowView.swift
//  eCommerce
//
//  Created by Imen Ksouri on 29/06/2023.
//

import SwiftUI

struct StoreRowView: View {
    var title: String
    var image: String
    var action: () -> Void

    var body: some View {
        Button {
            withAnimation {
                action()
            }
        } label: {
            HStack {
                Text(title)
                    .font(.custom(AppFont.semiBoldFont, size: 20))
                    .foregroundColor(RCValues.shared
                        .color(forKey: .primary))
                    .padding(.leading, 20)
                Spacer()
                Image(image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: UIScreen.main.bounds.width / 2 - 15)
            }
            .frame(height: 150)
            .background(RCValues.shared
                .color(forKey: .secondary))
            .cornerRadius(10)
        }
    }
}

struct StoreRowView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView {
            VStack(spacing: 10) {
                StoreRowView(title: "All", image: "all") {}
            }
            .padding(.horizontal, 15)
        }
    }
}
