//
//  PaymentInjection.swift
//  ios-bankApp
//
//  Created by Muhammad Fahmi on 14/11/23.
//

import UIKit

protocol PaymentInjection {
    func resolve() -> PaymentViewController
    func resolve() -> PaymentPresenter
    func resolve() -> PaymentRouter
}

extension PaymentInjection where Self: Injection {

    func resolve() -> PaymentViewController {
        let vc: PaymentViewController = PaymentViewController()
        let presenter: PaymentPresenter = self.resolve()
        let router: PaymentRouter = self.resolve()
        vc.presenter = presenter
        vc.presenter?.view = vc
        vc.presenter?.router = router
        return vc
    }
    
    func resolve() -> PaymentPresenter {
        return PaymentPresenter()
    }
    
    func resolve() -> PaymentRouter {
        return DefaultPaymentRouter(injection: self)
    }
    
}
