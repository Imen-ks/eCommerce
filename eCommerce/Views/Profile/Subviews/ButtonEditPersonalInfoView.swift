//
//  ButtonEditPersonalInfoView.swift
//  eCommerce
//
//  Created by Imen Ksouri on 07/07/2023.
//

import SwiftUI

struct ButtonEditPersonalInfoView: View {
    @Binding var isEditingPersonalInfo: Bool
    var body: some View {
        Button {
            isEditingPersonalInfo.toggle()
        } label: {
            Image(systemName: "square.and.pencil")
                .font(.custom(AppFont.semiBoldFont, size: 20))
                .foregroundColor(RCValues.shared
                    .color(forKey: .accent))
                .padding(.top)
                .padding(.trailing, 20)
        }
    }
}

struct ButtonEditPersonalInfoView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonEditPersonalInfoView(isEditingPersonalInfo: .constant(false))
    }
}
