//
//  DiscountDatabase.swift
//  eCommerce
//
//  Created by Imen Ksouri on 01/07/2023.
//

import Foundation

#if DEBUG
final class DiscountDatabase {
    static let discounts: [Discount] = [

        // MARK: - LACOSTE Products
        Discount(id: "10001", discountPercent: 30),
        Discount(id: "10002", discountPercent: 30),
        Discount(id: "10003", discountPercent: 40),
        Discount(id: "10004", discountPercent: 40),
        Discount(id: "10005", discountPercent: 30),
        Discount(id: "10006", discountPercent: 30),
        Discount(id: "10008", discountPercent: 40),
        Discount(id: "10009", discountPercent: 30),

        // MARK: - RALPH LAUREN Products
        Discount(id: "10012", discountPercent: 40),
        Discount(id: "10014", discountPercent: 20),
        Discount(id: "10018", discountPercent: 20),
        Discount(id: "10021", discountPercent: 40),
        Discount(id: "10022", discountPercent: 40),
        Discount(id: "10025", discountPercent: 20),

        // MARK: - ADIDAS Products
        Discount(id: "10032", discountPercent: 30),
        Discount(id: "10036", discountPercent: 40),
        Discount(id: "10038", discountPercent: 50),
        Discount(id: "10039", discountPercent: 30),

        // MARK: - HUGO BOSS Products
        Discount(id: "10042", discountPercent: 20),
        Discount(id: "10043", discountPercent: 40),
        Discount(id: "10044", discountPercent: 30),
        Discount(id: "10045", discountPercent: 40),
        Discount(id: "10046", discountPercent: 40),
        Discount(id: "10047", discountPercent: 40),
        Discount(id: "10049", discountPercent: 50),
        Discount(id: "10050", discountPercent: 30),
        Discount(id: "10051", discountPercent: 20),
        Discount(id: "10054", discountPercent: 50),
        Discount(id: "10055", discountPercent: 50),
        Discount(id: "10057", discountPercent: 30),

        // MARK: - DIESEL Products
        Discount(id: "10062", discountPercent: 40),
        Discount(id: "10064", discountPercent: 50),
        Discount(id: "10065", discountPercent: 50),
        Discount(id: "10069", discountPercent: 50),
        Discount(id: "10070", discountPercent: 50),

        // MARK: - GUESS Products
        Discount(id: "10079", discountPercent: 50),
        Discount(id: "10080", discountPercent: 30),
        Discount(id: "10081", discountPercent: 40),
        Discount(id: "10082", discountPercent: 40),
        Discount(id: "10083", discountPercent: 30),
        Discount(id: "10085", discountPercent: 30),
        Discount(id: "10087", discountPercent: 30),
        Discount(id: "10088", discountPercent: 30),
        Discount(id: "10092", discountPercent: 30),
        Discount(id: "10094", discountPercent: 40),

        // MARK: - REBOOK Products
        Discount(id: "10095", discountPercent: 50),
        Discount(id: "10096", discountPercent: 50),
        Discount(id: "10097", discountPercent: 50),
        Discount(id: "10099", discountPercent: 30),

        // MARK: - TOMMY HILFIGER Products
        Discount(id: "10100", discountPercent: 20),
        Discount(id: "10103", discountPercent: 30),
        Discount(id: "10105", discountPercent: 20),
        Discount(id: "10107", discountPercent: 20),
        Discount(id: "10109", discountPercent: 20),
        Discount(id: "10110", discountPercent: 50),
        Discount(id: "10113", discountPercent: 50),
        Discount(id: "10118", discountPercent: 50),

        // MARK: - ARMANI EXCHANGE Products
        Discount(id: "10119", discountPercent: 30),
        Discount(id: "10120", discountPercent: 30),
        Discount(id: "10121", discountPercent: 30),
        Discount(id: "10122", discountPercent: 30),
        Discount(id: "10124", discountPercent: 30),
        Discount(id: "10125", discountPercent: 30),
        Discount(id: "10126", discountPercent: 30),
        Discount(id: "10127", discountPercent: 30),
        Discount(id: "10128", discountPercent: 30),
        Discount(id: "10130", discountPercent: 30),

        // MARK: - PUMA Products
        Discount(id: "10132", discountPercent: 20),
        Discount(id: "10134", discountPercent: 30),
        Discount(id: "10135", discountPercent: 20),
        Discount(id: "10138", discountPercent: 20)
    ]
}
#endif
