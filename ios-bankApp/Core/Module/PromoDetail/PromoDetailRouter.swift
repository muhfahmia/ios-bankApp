//
//  PromoDetailRouter.swift
//  ios-bankApp
//
//  Created by Muhammad Fahmi on 15/11/23.
//

import UIKit

protocol PromoDetailRouter {
    func pushToPromoDetail(from: UIViewController, promoID: String)
}

struct DefaultPromoDetailRouter: PromoDetailRouter {
    
    private let injection: Injection
    
    init(injection: Injection) {
        self.injection = injection
    }
    
    func pushToPromoDetail(from: UIViewController, promoID: String) {
        let vc: PromoDetailViewController = injection.resolve()
        vc.hidesBottomBarWhenPushed = true
        vc.presenter?.promoID = promoID
        from.navigationController?.pushViewController(vc, animated: true)
    }
    
}
