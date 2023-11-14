//
//  UINavigationController.swift
//  ios-bankApp
//
//  Created by Muhammad Fahmi on 14/11/23.
//

import UIKit


public extension UINavigationBar {
    func makeTransparent(withTint tint: UIColor = .white) {
        let legacyAppearance = { [self] in
            isTranslucent = true
            backgroundColor = .clear
            barTintColor = .clear
            setBackgroundImage(UIImage(), for: .default)
            titleTextAttributes = [.foregroundColor: tint]
            shadowImage = UIImage()
        }
        #if os(tvOS)
        legacyAppearance()
        #else
        if #available(iOS 13.0, *) {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithTransparentBackground()
            appearance.titleTextAttributes = [.foregroundColor: tint]
            standardAppearance = appearance
            scrollEdgeAppearance = appearance
            compactAppearance = appearance
        } else {
            legacyAppearance()
        }
        #endif
        tintColor = tint
    }
}
