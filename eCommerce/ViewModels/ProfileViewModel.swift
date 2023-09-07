//
//  ProfileViewModel.swift
//  eCommerce
//
//  Created by Imen Ksouri on 06/07/2023.
//

import Foundation
import FirebaseAuth
import Combine

@MainActor
final class ProfileViewModel: ObservableObject {

    @Published var userAuth: User?
    @Published var profile: Profile?
    @Published var shippingAddress: ShippingAddress?
    @Published var firstName = ""
    @Published var lastName = ""
    @Published var phoneNumber = ""
    @Published var email = ""
    @Published var password = ""
    @Published var error = ""
    @Published var passwordIsChanged = false
    @Published var emailIsChanged = false
    @Published var streetNumber = ""
    @Published var streetName = ""
    @Published var postalCode = ""
    @Published var town = ""
    @Published var country = ""
    var emailUpdateSteps = 0
    private let authenticationManager: AuthenticationManager
    private let userManager: UserRepository
    private var cancellables: Set<AnyCancellable> = []

    init(authenticationManager: AuthenticationManager, userManager: UserRepository) {
        self.authenticationManager = authenticationManager
        self.userManager = userManager
    }

    func getUser() {
        self.userAuth = authenticationManager.user
    }

    func getUserAuthEmail() -> String {
        if let userAuth {
            return userAuth.email ?? ""
        }
        return ""
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
        if let userAuth {
            Task {
                do {
                    try await userManager.updateUserInfo(
                        userId: userAuth.uid,
                        firstName: firstName,
                        lastName: lastName,
                        phoneNumber: phoneNumber)
                } catch let(error) {
                    self.error = error.localizedDescription
                }
            }
        }
    }

    func updateEmail() {
        if let userAuth {
            Task {
                if authenticationManager.user?.email != email || authenticationManager.user?.email != profile?.email  {
                    do {
                        try await authenticationManager.updateEmail(email: email)
                        emailUpdateSteps += 1
                        if emailUpdateSteps == 2 {
                            self.emailIsChanged = true
                            emailUpdateSteps = 0
                        }
                    } catch let(error) {
                        self.error = error.localizedDescription
                    }
                }
            }
            Task {
                if profile?.email != email || authenticationManager.user?.email != profile?.email {
                    do {
                        try await userManager.updateUserEmail(
                            userId: userAuth.uid, email: email)
                        emailUpdateSteps += 1
                        if emailUpdateSteps == 2 {
                            self.emailIsChanged = true
                            emailUpdateSteps = 0
                        }
                    } catch let(error) {
                        self.error = error.localizedDescription
                    }
                }
            }
        }
    }

    func updatePassword() {
        Task {
            do {
                try await authenticationManager.updatePassword(password: password)
                self.passwordIsChanged = true
            } catch {
                self.error = error.localizedDescription
            }
        }
    }

    func signOut() {
        do {
            try authenticationManager.signOut()
        } catch {
            self.error = error.localizedDescription
        }
    }

    func deleteAccount() {
        Task {
            do {
                try await authenticationManager.delete()
            } catch let(error) {
                self.error = error.localizedDescription
            }
        }
    }

    func addListenerForShippingAddress() {
        guard let user = authenticationManager.user else { return }
        userManager.addListenerForShippingAddress(userId: user.uid)
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
}
