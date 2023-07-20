//
//  RemoveCartItemButtonView.swift
//  eCommerce
//
//  Created by Imen Ksouri on 05/07/2023.
//

import SwiftUI

struct RemoveCartItemButtonView: View {
    let action: () -> Void

    var body: some View {
        Button {
            withAnimation {
                action()
            }
        } label: {
            Image(systemName: "trash")
                .foregroundColor(Color(UIColor.secondaryLabel))
                .padding(.top, 5)
        }
    }
}

struct RemoveCartItemButtonView_Previews: PreviewProvider {
    static var previews: some View {
        RemoveCartItemButtonView() {}
    }
}
