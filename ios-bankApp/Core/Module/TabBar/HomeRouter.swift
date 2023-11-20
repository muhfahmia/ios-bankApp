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
    var promoVC: PromoViewController { get }
    var chartVC: ChartViewController { get }
}

struct DefaultHomeRouter: HomeRouter {
    
    private let injection: Injection
    
    init(injection: Injection) {
        self.injection = injection
    }
    
    var bankAccountVC: BankAccountViewController {
        injection.resolve()
    }
    
    var promoVC: PromoViewController {
        injection.resolve()
    }
    
    var chartVC: ChartViewController {
        injection.resolve()
    }
    
    func appRoute(window: UIWindow?) {
        let homeTabBar: HomeTabBarController = injection.resolve()
        window?.rootViewController = homeTabBar
        window?.makeKeyAndVisible()
    }
    
}
