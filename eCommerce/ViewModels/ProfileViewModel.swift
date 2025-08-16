//
//  ProfileViewModel.swift
//  eCommerce
//
//  Created by Imen Ksouri on 06/07/2023.
//

import Foundation
import FirebaseAuth
import Combine
import FirebaseAnalytics

@MainActor
final class ProfileViewModel: ObservableObject {
    @Published var profile: Profile?
    @Published var shippingAddress: ShippingAddress?
    @Published var firstName = ""
    @Published var lastName = ""
    @Published var phoneNumber = ""
    @Published var newEmail = ""
    @Published var currentPassword = ""
    @Published var newPassword = ""
    @Published var error = ""
    @Published var passwordIsUpdated = false
    @Published var emailUpdateIsRequested = false
    @Published var emailIsUpdated = false
    @Published var streetNumber = ""
    @Published var streetName = ""
    @Published var postalCode = ""
    @Published var town = ""
    @Published var country = ""
    @Published var userIsUnauthorized = false
    private var userAuth: User?
    private let authenticationManager: AuthenticationManager
    private let userManager: UserRepository
    private var cancellables: Set<AnyCancellable> = []

    init(
        authenticationManager: AuthenticationManager,
        userManager: UserRepository
    ) {
        self.authenticationManager = authenticationManager
        self.userManager = userManager
        getProfile()
        addListenerForShippingAddress()
        authenticationManager.$user.sink { user in
            guard let user else { return }
            self.userAuth = user
            guard let email = user.email else { return }
            if email != self.profile?.email {
                Task {
                    try await userManager.updateUserEmail(
                        userId: user.uid, email: email)
                    self.getProfile()
                }
            }
        }
        .store(in: &cancellables)
    }

    func getUserAuthEmail() -> String {
        userAuth?.email ?? ""
    }

    func getProfile() {
        Task {
            do {
                if let userAuth {
                    self.profile = try await userManager.getUserProfile(userId: userAuth.uid)
                    self.firstName = self.profile?.firstName ?? ""
                    self.lastName = self.profile?.lastName ?? ""
                    self.phoneNumber = self.profile?.phoneNumber ?? ""
                }
            } catch {
                print(error)
            }
        }
    }

    func updateUserInfo() {
        Task {
            do {
                if let userAuth {
                    try await userManager.updateUserInfo(
                        userId: userAuth.uid,
                        firstName: firstName,
                        lastName: lastName,
                        phoneNumber: phoneNumber)
                }
            } catch let(error) {
                self.error = error.localizedDescription
            }
        }
    }

    func sendUpdateLink() {
        Task {
            guard let userAuth, let currentEmail = userAuth.email else {
                return
            }
            authenticationManager.reauthenticate(
                user: userAuth,
                email: currentEmail,
                password: currentPassword) { [weak self] _, error in
                    if error != nil {
                        self?.removeUserAuth()
                        self?.signOut()
                        return
                    }
            }
            do {
                try await authenticationManager.sendUpdateLink(
                    to: newEmail)
                emailUpdateIsRequested = true
            } catch {
                self.error = error.localizedDescription
            }
        }
    }

    func reloadUser() {
        guard let userAuth else {
            removeUserAuth()
            return
        }
        authenticationManager.reauthenticate(
            user: userAuth,
            email: newEmail,
            password: currentPassword) { [weak self] result, _ in
                if result != nil {
                    self?.emailIsUpdated = true
                    self?.authenticationManager.reload()
                }
            }
    }

    func updatePassword() {
        Task {
            do {
                try await authenticationManager.updatePassword(
                    with: newPassword)
                self.passwordIsUpdated = true
            } catch {
                self.error = error.localizedDescription
            }
        }
    }

    func signOut() {
        do {
            try authenticationManager.signOut()
            removeUserAuth()
        } catch {
            self.error = error.localizedDescription
        }
    }

    func deleteAccount() {
        Task {
            do {
                try await authenticationManager.delete()
                removeUserAuth()
            } catch let(error) {
                self.error = error.localizedDescription
            }
        }
    }

    func removeUserAuth() {
        userIsUnauthorized = true
    }

    func addListenerForShippingAddress() {
        guard let userAuth else { return }
        userManager.addListenerForShippingAddress(userId: userAuth.uid)
            .sink { completion in
                
            } receiveValue: { [weak self] address in
                self?.shippingAddress = address.first
                self?.streetNumber = address.first?.streetNumber ?? ""
                self?.streetName = address.first?.streetName ?? ""
                self?.postalCode = address.first?.postalCode ?? ""
                self?.town = address.first?.town ?? ""
                self?.country = address.first?.country ?? ""
            }
            .store(in: &cancellables)
    }

    func addShippingAddress() {
        Task {
            do {
                if let userAuth {
                    let address = ShippingAddress(
                        id: userAuth.uid,
                        streetNumber: streetNumber,
                        streetName: streetName,
                        postalCode: postalCode,
                        town: town,
                        country: country)
                    try await userManager.addShippingAddress(
                        userId: userAuth.uid, address: address)
                    logEventAddShippingInfo()
                }
            } catch {
                print(error)
            }
        }
    }

    func removeShippingAddress() {
        Task {
            do {
                if let userAuth {
                    try await userManager.removeUserShippingAddress(userId: userAuth.uid)
                }
            } catch {
                print(error)
            }
        }
    }

    func logEventAddShippingInfo() {
        FirebaseAnalytics.Analytics.logEvent(AnalyticsEventAddShippingInfo, parameters: [
            AnalyticsParameterLocation: "\(town), \(country)"
        ])
    }
}
