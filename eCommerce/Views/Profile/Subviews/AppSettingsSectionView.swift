//
//  AppSettingsSectionView.swift
//  eCommerce
//
//  Created by Imen Ksouri on 11/07/2023.
//

import SwiftUI

struct AppSettingsSectionView: View {
    let action: () -> Void

    var body: some View {
        Button {
            action()
        } label: {
            HStack {
                Text("APP SETTINGS")
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

struct AppSettingsSectionView_Previews: PreviewProvider {
    static var previews: some View {
        AppSettingsSectionView() {}
    }
}
