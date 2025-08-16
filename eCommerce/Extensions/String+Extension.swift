//
//  String+Extension.swift
//  eCommerce
//
//  Created by Imen Ksouri on 26/06/2023.
//

import Foundation

extension String {
    public func toRGBA() -> (r: CGFloat, g: CGFloat, b: CGFloat, alpha: CGFloat) {
        var hex:String = self.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if (hex.hasPrefix("#")) {
            hex.remove(at: hex.startIndex)
        }

        if ((hex.count) != 6) {
            return (r: 0.0, g: 0.0, b: 0.0, alpha: 0.0)
        }

        var rgbValue:UInt64 = 0
        Scanner(string: hex).scanHexInt64(&rgbValue)

        return (
            r: CGFloat((rgbValue & 0xFF0000) >> 16),
            g: CGFloat((rgbValue & 0x00FF00) >> 8),
            b: CGFloat(rgbValue & 0x0000FF),
            alpha: CGFloat(1.0))
    }

    func isValidEmail() -> Bool {
        let pattern = """
            ^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$
            """
        if let regex = try? NSRegularExpression(pattern: pattern, options: .caseInsensitive) {
            return regex.firstMatch(in: self, options: [], range: NSRange(location: 0, length: count)) != nil
        }
        return false
    }
}
