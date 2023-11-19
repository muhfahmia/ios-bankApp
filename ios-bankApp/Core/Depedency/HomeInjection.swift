//
//  HomeInjection.swift
//  ios-bankApp
//
//  Created by Muhammad Fahmi on 13/11/23.
//

import Foundation

protocol HomeInjection {
    func resolve() -> HomeTabBarController
    func resolve() -> HomeRouter
}

extension HomeInjection where Self: Injection {
    
    func resolve() -> HomeTabBarController {
        return HomeTabBarController(router: resolve())
    }
    
    func resolve() -> HomeRouter {
        return DefaultHomeRouter(injection: self)
    }
}
