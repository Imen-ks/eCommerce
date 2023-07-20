//
//  Color+Extension.swift
//  eCommerce
//
//  Created by Imen Ksouri on 26/06/2023.
//

import Foundation
import SwiftUI

extension Color {
    init(hex: String) {
        let rgba = hex.toRGBA()

        self.init(.sRGB,
              red: Double(rgba.r) / 0xFF,
              green: Double(rgba.g) / 0xFF,
              blue: Double(rgba.b) / 0xFF,
              opacity: Double(rgba.alpha))
    }

    func toHex() -> String {
        let uic = UIColor(self)
        guard let components = uic.cgColor.components, components.count >= 3 else {
            return ""
        }
        let r = Float(components[0])
        let g = Float(components[1])
        let b = Float(components[2])
        var a = Float(1.0)

        if components.count >= 4 {
            a = Float(components[3])
        }

        if a != Float(1.0) {
            return String(format: "%02lX%02lX%02lX%02lX", lroundf(r * 255), lroundf(g * 255), lroundf(b * 255), lroundf(a * 255))
        } else {
            return String(format: "%02lX%02lX%02lX", lroundf(r * 255), lroundf(g * 255), lroundf(b * 255))
        }
    }
}

extension Color: Codable {
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let hex = try container.decode(String.self)

        self.init(hex: hex)
    }
  
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(toHex())
    }
}
