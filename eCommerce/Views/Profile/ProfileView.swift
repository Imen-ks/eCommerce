//
//  ProfileView.swift
//  eCommerce
//
//  Created by Imen Ksouri on 21/06/2023.
//

import SwiftUI

struct ProfileView: View {
    @Environment(\.scenePhase) private var scenePhase
    private let authenticationManager: AuthenticationManager
    private let userManager: UserManager
    @Binding var showAuthentication: Bool
    @State private var isEditingPersonalInfo = false
    @State private var isAddingAddress = false
    @State private var isShowingOrders = false
    @State private var isShowingAppSettings = false
    @State private var showError = false
    @StateObject var viewModel: ProfileViewModel

    init(
        authenticationManager: AuthenticationManager,
        userManager: UserManager,
        showAuthentication: Binding<Bool>
    ) {
        self.authenticationManager = authenticationManager
        self.userManager = userManager
        self._showAuthentication = showAuthentication
        self._viewModel = .init(
            wrappedValue: ProfileViewModel(
                authenticationManager: authenticationManager,
                userManager: userManager
            )
        )
    }

    var body: some View {
        NavigationStack {
            ScrollView {
                PersonalInfoView(profile: viewModel.profile)
                .overlay(alignment: .topTrailing) {
                    ButtonEditPersonalInfoView(isEditingPersonalInfo: $isEditingPersonalInfo)
                    .navigationDestination(isPresented: $isEditingPersonalInfo, destination: {
                        EditPersonalInfoView(
                            isEditingPersonalInfo: $isEditingPersonalInfo,
                            showError: $showError,
                            viewModel: viewModel
                        )
                        .alert(isPresented: $showError) {
                            Alert(title: Text("User Info Update Error"), message: Text(viewModel.error), dismissButton: .default(Text("Ok")))
                        }
                        .onChange(of: viewModel.error) { newValue in
                            guard !newValue.isEmpty else {
                                return
                            }
                            showError = true
                        }
                    })
                }
                ShippingAddressSectionView(
                    fields: [
                        (label: "Street Number", value: $viewModel.streetNumber),
                        (label: "Street Name", value: $viewModel.streetName),
                        (label: "Postal Code", value: $viewModel.postalCode),
                        (label: "Town", value: $viewModel.town),
                        (label: "Country", value: $viewModel.country)
                    ],
                    isAddingAddress: $isAddingAddress,
                    shippingAddress: viewModel.shippingAddress
                ) {
                    viewModel.addShippingAddress()
                    isAddingAddress.toggle()
                } removeAction: {
                    viewModel.removeShippingAddress()
                    isAddingAddress.toggle()
                }
                .offset(y: -8)
                Divider()
                    .offset(y: -16)
                OrdersSectionView {
                    isShowingOrders.toggle()
                }
                .padding(.top, -8)
                .navigationDestination(isPresented: $isShowingOrders) {
                    OrderListView(
                        authenticationManager: AuthenticationManager(),
                        userManager: UserManager()
                    )
                }
                Divider()
                AppSettingsSectionView {
                    isShowingAppSettings.toggle()
                }
                .padding(.top, 8)
                .navigationDestination(isPresented: $isShowingAppSettings) {
                    //
                }
                Divider()
            }
            .navigationTitle("My Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    MenuButtonView  {
                        viewModel.signOut()
                    }
                }
            }
            .onChange(of: viewModel.userIsUnauthorized) { _ in
                showAuthentication.toggle()
            }
            .onChange(of: scenePhase) { newPhase in
                if newPhase == .active {
                    viewModel.reloadUser()
                }
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(
            authenticationManager: AuthenticationManager(),
            userManager: UserManager(),
            showAuthentication: .constant(false)
        )
    }
}
