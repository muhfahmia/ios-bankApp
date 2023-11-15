//
//  UINavigationController.swift
//  ios-bankApp
//
//  Created by Muhammad Fahmi on 14/11/23.
//

import UIKit


public extension UINavigationBar {
    
    func setTitleFont(_ font: UIFont, color: UIColor = .black) {
        var attrs = [NSAttributedString.Key: Any]()
        attrs[.font] = font
        attrs[.foregroundColor] = color
        if #available(iOS 13.0, tvOS 13.0, *) {
            standardAppearance.titleTextAttributes = attrs
            scrollEdgeAppearance?.titleTextAttributes = attrs
            compactAppearance?.titleTextAttributes = attrs
        } else {
            titleTextAttributes = attrs
        }
    }
    
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
