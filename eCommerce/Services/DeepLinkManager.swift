//
//  DeepLinkManager.swift
//  eCommerce
//
//  Created by Imen Ksouri on 17/08/2025.
//

import FirebaseAuth

class DeepLinkManager: ObservableObject {
    @Published var emailLinkVerificationHandled: Bool = false

    func handleFirebaseAuthLink(_ url: URL) {
        print("Received URL: \(url)")
        guard let components = URLComponents(url: url, resolvingAgainstBaseURL: false),
              let queryItems = components.queryItems else {
            return
        }

        let finalUrl: URL

        /// case where the URL containing the action is embedded in a parameter `link`
        if let embeddedLinkString = queryItems.first(where: { $0.name == "link" })?.value, let embeddedURL = URL(string: embeddedLinkString) {
            finalUrl = embeddedURL
        } else { /// otherwise proceed with the initial URL
            finalUrl = url
        }
        guard
            let components = URLComponents(url: finalUrl, resolvingAgainstBaseURL: false),
            let queryItems = components.queryItems,
            let mode = queryItems.first(where: { $0.name == "mode" })?.value,
            let oobCode = queryItems.first(where: { $0.name == "oobCode" })?.value
        else {
            print("Failed to extract Firebase Auth link parameters")
            return
        }

        switch mode {
        case "verifyAndChangeEmail", "verifyEmail":
            Auth.auth().applyActionCode(oobCode) {[weak self] error in
                if let error = error {
                    print(error)
                } else {
                    print("Email successfully verified")
                }
                self?.emailLinkVerificationHandled = true
            }
        default: break
        }
    }
}
