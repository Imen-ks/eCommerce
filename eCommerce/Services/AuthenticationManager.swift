//
//  AuthenticationManager.swift
//  eCommerce
//
//  Created by Imen Ksouri on 17/06/2023.
//

import Foundation
import FirebaseAuth

final class AuthenticationManager: ObservableObject {
    @Published var user: User?
    private var authenticationStateHandle: AuthStateDidChangeListenerHandle?

    init() {
        addListener()
    }

    private func addListener() {
        removeListener()
        authenticationStateHandle = Auth.auth()
            .addStateDidChangeListener { _, user in
                self.user = user
            }
    }

    func removeListener() {
        if let handle = authenticationStateHandle {
            Auth.auth().removeStateDidChangeListener(handle)
        }
    }

    func register(email: String,
                  password: String) async throws -> User {
        let authDataResult = try await Auth.auth().createUser(withEmail: email, password: password)
        return authDataResult.user
    }

    func signIn(email: String,
                password: String) async throws {
        try await Auth.auth().signIn(withEmail: email, password: password)
    }

    func signOut() throws {
        try Auth.auth().signOut()
    }

    func resetPassword(email: String) async throws {
        try await Auth.auth().sendPasswordReset(withEmail: email)
    }
    
    func updatePassword(with password: String) async throws {
        guard let user else {
            fatalError("No user logged in")
        }
        try await user.updatePassword(to: password)
    }

    func sendUpdateLink(to newEmail: String) async throws {
        guard let user else {
            fatalError("No user logged in")
        }
        let actionCodeSettings = FirebaseAuth.ActionCodeSettings()
        actionCodeSettings.url = URL(string: "https://ecommerceapp-b752b.web.app/")!
        actionCodeSettings.handleCodeInApp = true
        actionCodeSettings.setIOSBundleID(Bundle.main.bundleIdentifier!)
        try await user.sendEmailVerification(beforeUpdatingEmail: newEmail, actionCodeSettings: actionCodeSettings)
    }

    func delete() async throws {
        guard let user else {
            fatalError("No user logged in")
        }
        try await user.delete()
    }

    func reauthenticate(
        email: String,
        password: String,
        completion: ((AuthDataResult?, (any Error)?) -> Void)?) {
        guard let user else {
            fatalError("No user logged in")
        }
        let credential = EmailAuthProvider.credential(withEmail: email, password: password)
        user.reauthenticate(with: credential, completion: completion)
    }

    func reload() {
        guard let user else {
            fatalError("No user logged in")
        }
        user.reload { error in
            if error == nil {
                self.user = Auth.auth().currentUser
            }
        }
    }
}
