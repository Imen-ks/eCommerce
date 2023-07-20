//
//  MenuButtonView.swift
//  eCommerce
//
//  Created by Imen Ksouri on 07/07/2023.
//

import SwiftUI

struct MenuButtonView: View {
    let signOutAction: () -> Void

    var body: some View {
        Menu {
            Button {
                withAnimation {
                    signOutAction()
                }
            } label: {
                Text("Sign out")
            }
        } label: {
            Image(systemName: "rectangle.portrait.and.arrow.right")
        }
    }
}

struct MenuButtonView_Previews: PreviewProvider {
    static var previews: some View {
        MenuButtonView {}
    }
}
