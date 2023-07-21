//
//  RCValues.swift
//  eCommerce
//
//  Created by Imen Ksouri on 21/07/2023.
//

import Foundation
import FirebaseRemoteConfig
import SwiftUI

enum ValueKey: String {
    case primary
    case secondary
    case accent
    case tabBarBackground
    case tabBarLabel
}

class RCValues {
    static let shared = RCValues()
    private var remoteConfig: RemoteConfig

    private init() {
        remoteConfig = RemoteConfig.remoteConfig()
        let settings = RemoteConfigSettings()
        settings.minimumFetchInterval = 0
        remoteConfig.configSettings = settings
        loadDefaultValues()
        fetchCloudValues()
    }

    func loadDefaultValues() {
        let appDefaults: [String: Any] = [
            ValueKey.primary.rawValue: "#2F2440",
            ValueKey.secondary.rawValue: "#C6B79B",
            ValueKey.accent.rawValue: "#710117",
            ValueKey.tabBarBackground.rawValue: "#F6EEE0",
            ValueKey.tabBarLabel.rawValue: "#710117",
        ]
        remoteConfig.setDefaults(appDefaults as? [String: NSObject])
    }

    func fetchCloudValues() {
        remoteConfig.fetch { (status, error) -> Void in
          if status == .success {
            print("Config fetched!")
            self.remoteConfig.activate { changed, error in
              // ...
            }
          } else {
            print("Config not fetched")
            print("Error: \(error?.localizedDescription ?? "No error available.")")
          }
        }
    }

    func color(forKey key: ValueKey) -> Color {
        let colorAsHexString = remoteConfig.configValue(forKey: key.rawValue)
            .stringValue ?? "Undefined"
        let convertedColor = Color.init(hex: colorAsHexString)
        return convertedColor
    }
}
