//
//  ProfileView.swift
//  eCommerce
//
//  Created by Imen Ksouri on 21/06/2023.
//

import SwiftUI
import FirebaseAnalytics

struct ProfileView: View {
    @Binding var showAuthentication: Bool
    @State private var didAppear = false
    @State private var isEditingPersonalInfo = false
    @State private var isAddingAddress = false
    @State private var isAddingPaymentDetails = false
    @State private var isShowingOrders = false
    @State private var isShowingAppSettings = false
    @State private var showError = false
    @ObservedObject var viewModel: ProfileViewModel
    @ObservedObject var ordersViewModel: OrdersViewModel

    var body: some View {
        NavigationStack {
            ScrollView {
                PersonalInfoView(
                    firstName: viewModel.profile?.firstName ?? "",
                    lastName: viewModel.profile?.lastName ?? "",
                    email: viewModel.getUserAuthEmail())
                .overlay(alignment: .topTrailing) {
                    ButtonEditPersonalInfoView(isEditingPersonalInfo: $isEditingPersonalInfo)
                    .navigationDestination(isPresented: $isEditingPersonalInfo, destination: {
                        EditPersonalInfoView(
                            fields: [
                                (icon: "person", label: "First Name", value: $viewModel.firstName),
                                (icon: "person", label: "Last Name", value: $viewModel.lastName),
                                (icon: "phone", label: "Phone Number", value: $viewModel.phoneNumber)
                            ],
                            currentEmail: viewModel.getUserAuthEmail(),
                            isEditingPersonalInfo: $isEditingPersonalInfo,
                            newPassword: $viewModel.password,
                            passwordIsChanged: $viewModel.passwordIsChanged,
                            newEmail: $viewModel.email,
                            emailIsChanged: $viewModel.emailIsChanged,
                            showError: $showError,
                            error: $viewModel.error
                        ) {
                            viewModel.updateUserInfo()
                        } changeEmailAction: {
                            viewModel.updateEmail()
                        } changePasswordAction: {
                            viewModel.updatePassword()
                        } signOutAction: {
                            viewModel.signOut()
                            showAuthentication.toggle()
                        } deleteAccountAction: {
                            viewModel.deleteAccount()
                        }
                        .alert(isPresented: $showError) {
                            Alert(title: Text("User Info Update Error"), message: Text(viewModel.error), dismissButton: .default(Text("Ok")))
                        }
                        .onChange(of: viewModel.error) { newValue in
                            guard !newValue.isEmpty else {
                                return
                            }
                            showError = true
                        }
                        .onChange(of: viewModel.userAuth) { newValue in
                            if newValue == nil {
                                showAuthentication.toggle()
                            }
                        }
                    })
                }
                ShippingAddressSectionView(
                    fields:
                        [
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
                    FirebaseAnalytics.Analytics.logEvent(AnalyticsEventAddShippingInfo, parameters: [
                        AnalyticsParameterLocation: "\(viewModel.town), \(viewModel.country)"
                    ])
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
                        viewModel: ordersViewModel)
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
            .onAppear {
                if !didAppear {
                    viewModel.addListenerForShippingAddress()
                    didAppear = true
                }
                viewModel.getProfile()
                viewModel.getUser()
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    MenuButtonView  {
                        viewModel.signOut()
                        showAuthentication.toggle()
                    }
                }
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(
            showAuthentication: .constant(false),
            viewModel: ProfileViewModel(
                authenticationManager: AuthenticationManager(),
                userManager: UserManager()),
            ordersViewModel: OrdersViewModel(
                authenticationManager: AuthenticationManager(),
                userManager: UserManager()))
    }
}
