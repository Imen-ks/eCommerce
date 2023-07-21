//
//  PersonalInfoView.swift
//  eCommerce
//
//  Created by Imen Ksouri on 07/07/2023.
//

import SwiftUI

struct PersonalInfoView: View {
    let firstName: String
    let lastName: String
    let email: String

    var body: some View {
        VStack {
            Divider()
            VStack(spacing: 10) {
                Text("\(firstName) \(lastName)".uppercased())
                    .font(.custom(AppFont.extraBoldFont, size: 30))
                    .multilineTextAlignment(.center)
                Text(email)
                    .font(.custom(AppFont.regularFont, size: 18))
            }
            .frame(maxWidth: .infinity)
            .padding(.horizontal)
            .padding(.top, 50)
            .padding(.bottom, 30)
            Divider()
        }
        .background(RCValues.shared
            .color(forKey: .tabBarBackground))
        .foregroundColor(RCValues.shared
            .color(forKey: .primary))
    }
}

struct PersonalInfoView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView {
            PersonalInfoView(firstName: "Jane", lastName: "Doe", email: "jane@doe.com")
        }
    }
}
