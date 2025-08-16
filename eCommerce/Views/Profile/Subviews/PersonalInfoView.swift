//
//  PersonalInfoView.swift
//  eCommerce
//
//  Created by Imen Ksouri on 07/07/2023.
//

import SwiftUI

struct PersonalInfoView: View {
    let profile: Profile?

    var body: some View {
        if let profile {
            VStack {
                Divider()
                VStack(spacing: 10) {
                    Text("\(profile.firstName) \(profile.lastName)".uppercased())
                        .font(.custom(AppFont.extraBoldFont, size: 30))
                        .multilineTextAlignment(.center)
                    if let email = profile.email {
                        Text(email)
                            .font(.custom(AppFont.regularFont, size: 18))
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.horizontal)
                .padding(.top, 50)
                .padding(.bottom, 30)
                Divider()
            }
            .background(
                RCValues.shared.color(forKey: .tabBarBackground)
            )
            .foregroundColor(
                RCValues.shared.color(forKey: .primary)
            )
        }
    }
}

struct PersonalInfoView_Previews: PreviewProvider {
    static var profile = Profile(
        uid: UUID().uuidString,
        email: "jane@doe.com",
        firstName: "Jane",
        lastName: "Doe"
    )
    static var previews: some View {
        ScrollView {
            PersonalInfoView(profile: profile)
        }
    }
}
