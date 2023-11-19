//
//  String.swift
//  ios-bankApp
//
//  Created by Muhammad Fahmi on 13/11/23.
//

import Foundation

public extension String {
    func rupiahFormat(from number: Double) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencyCode = "IDR"

        if let formattedString = formatter.string(from: NSNumber(value: number)) {
            return formattedString
        } else {
            return ""
        }
    }
}
