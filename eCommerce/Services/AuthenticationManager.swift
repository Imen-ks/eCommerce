//
//  AuthenticationManager.swift
//  eCommerce
//
//  Created by Imen Ksouri on 17/06/2023.
//

import Foundation
import FirebaseAuth

final class AuthenticationManager: ObservableObject {
    
    var user: User?
    private var authenticationStateHandle: AuthStateDidChangeListenerHandle?

    init() {
        addListner()
    }

    private func addListner() {
        if let handle = authenticationStateHandle {
            Auth.auth().removeStateDidChangeListener(handle)
        }
        authenticationStateHandle = Auth.auth()
            .addStateDidChangeListener { _, user in
                self.user = user
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
    
    func updatePassword(password: String) async throws {
        guard let user = user else {
            fatalError("No user logged in")
        }
        try await user.updatePassword(to: password)
    }

    func updateEmail(email: String) async throws {
        guard let user = user else {
            fatalError("No user logged in")
        }
        try await user.updateEmail(to: email)
    }

    func delete() async throws {
        guard let user = user else {
            fatalError("No user logged in")
        }
        try await user.delete()
    }
}
