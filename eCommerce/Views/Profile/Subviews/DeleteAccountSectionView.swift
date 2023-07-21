//
//  DeleteAccountSectionView.swift
//  eCommerce
//
//  Created by Imen Ksouri on 08/07/2023.
//

import SwiftUI

struct DeleteAccountSectionView: View {
    let action: () -> Void

    var body: some View {
        VStack {
            LabeledContent {
                VStack {
                    VStack {
                        Button {
                            action()
                        } label: {
                            HStack {
                                Text("DELETE ACCOUNT")
                                    .font(.custom(AppFont.semiBoldFont, size: 15))
                                    .foregroundColor(.white)
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .font(.custom(AppFont.regularFont, size: 20))
                                    .foregroundColor(Color(UIColor.white))
                            }
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                        }
                        .padding(.horizontal, 20)
                    }
                    .padding(.top, 5)
                    .padding(.vertical, 10)
                    Divider()
                }
                .background(RCValues.shared
                    .color(forKey: .accent).opacity(0.8))
                .cornerRadius(10)
                .padding(.leading, 10)
            } label: {
                Image(systemName: "xmark")
                    .foregroundColor(RCValues.shared
                        .color(forKey: .accent))
                    .frame(width: 20)
            }
        }
        .padding([.horizontal, .bottom])
    }
}

struct DeleteAccountSectionView_Previews: PreviewProvider {
    static var previews: some View {
        DeleteAccountSectionView() {}
            .frame(height: 50)
    }
}
