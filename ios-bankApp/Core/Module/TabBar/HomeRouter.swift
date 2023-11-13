//
//  HomeRouter.swift
//  ios-bankApp
//
//  Created by Muhammad Fahmi on 13/11/23.
//

import UIKit

protocol HomeRouter {
    func appRoute(window: UIWindow?)
    var bankAccountVC: BankAccountViewController { get }
}

struct DefaultHomeRouter: HomeRouter {
    
    private let injection: Injection
    
    init(injection: Injection) {
        self.injection = injection
    }
    
    var bankAccountVC: BankAccountViewController {
        injection.resolve()
    }
    
    func appRoute(window: UIWindow?) {
        let homeTabBar: HomeTabBarController = injection.resolve()
        window?.rootViewController = homeTabBar
        window?.makeKeyAndVisible()
    }
    
}
