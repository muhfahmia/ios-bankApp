//
//  PromoRouter.swift
//  ios-bankApp
//
//  Created by Muhammad Fahmi on 15/11/23.
//

import UIKit

protocol PromoRouter {
    func routeToPromoDetail(from: UIViewController, promoID: String)
}

struct DefaultPromoRouter: PromoRouter {
    
    private let injection: Injection
    
    init(injection: Injection) {
        self.injection = injection
    }
    
    func routeToPromoDetail(from: UIViewController, promoID: String) {
        let router: PromoDetailRouter = injection.resolve()
        router.pushToPromoDetail(from: from, promoID: promoID)
    }
    
}
