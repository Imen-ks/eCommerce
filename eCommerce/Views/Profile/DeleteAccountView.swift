//
//  DeleteAccountView.swift
//  eCommerce
//
//  Created by Imen Ksouri on 08/07/2023.
//

import SwiftUI

struct DeleteAccountView: View {
    @State private var showAlert = false
    @Binding var isShowingDeleteAccount: Bool
    let action: () -> Void

    var body: some View {
        VStack {
            Text("Click below if you want to delete your account. This will permanently remove your account from our systems.\n\nThis action being sensitive, please consider signing out and and signing in again to be able to proceed.")
                .font(.custom(AppFont.regularFont, size: 18))
                .padding(.vertical, 20)
                .foregroundColor(RCValues.shared
                    .color(forKey: .primary))
                .cornerRadius(10)
            Button {
                withAnimation {
                    showAlert.toggle()
                }
            } label: {
                Text("Delete my account")
                    .padding(.vertical, 12)
                    .font(.custom(AppFont.semiBoldFont, size: 20))
                    .frame(maxWidth: .infinity)
                    .background(.black)
                    .cornerRadius(10)
            }
            .foregroundColor(.white)
            .alert(isPresented:$showAlert) {
                Alert(
                    title: Text("Are you sure you want to delete your account?"),
                    message: Text("This action is permanent."),
                    primaryButton: .destructive(Text("Delete")) {
                        action()
                    },
                    secondaryButton: .cancel()
                )
            }
            Spacer()
        }
        .padding(.horizontal, 30)
        .navigationTitle("Delete Account")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    isShowingDeleteAccount.toggle()
                } label: {
                    Image(systemName: "chevron.left")
                }
            }
        }
    }
}

struct DeleteAccountView_Previews: PreviewProvider {
    static var previews: some View {
        DeleteAccountView(isShowingDeleteAccount: .constant(false)) {}
    }
}
