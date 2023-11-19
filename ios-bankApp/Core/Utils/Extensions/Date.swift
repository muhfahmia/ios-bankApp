//
//  Date.swift
//  ios-bankApp
//
//  Created by Muhammad Fahmi on 16/11/23.
//

import Foundation

public extension Date {
    enum DayNameStyle {
        /// SwifterSwift: 3 letter day abbreviation of day name.
        case threeLetters

        /// SwifterSwift: 1 letter day abbreviation of day name.
        case oneLetter

        /// SwifterSwift: Full day name.
        case full
    }

    /// SwifterSwift: Month name format.
    ///
    /// - threeLetters: 3 letter month abbreviation of month name.
    /// - oneLetter: 1 letter month abbreviation of month name.
    /// - full: Full month name.
    enum MonthNameStyle {
        /// SwifterSwift: 3 letter month abbreviation of month name.
        case threeLetters

        /// SwifterSwift: 1 letter month abbreviation of month name.
        case oneLetter

        /// SwifterSwift: Full month name.
        case full
    }
    
    func string(withFormat format: String = "dd/MM/yyyy HH:mm") -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.timeZone = TimeZone(identifier: "Asia/Jakarta")
        return dateFormatter.string(from: self)
    }
}
