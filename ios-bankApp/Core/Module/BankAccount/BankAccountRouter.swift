//
//  HomeRouter.swift
//  ios-bankApp
//
//  Created by Muhammad Fahmi on 13/11/23.
//

import UIKit

protocol BankAccountRouter {
    func routeToPayment(from vc: UIViewController)
}

struct DefaultBankAccountRouter: BankAccountRouter {
    
    private let injection: Injection
    
    init(injection: Injection) {
        self.injection = injection
    }
    
    func routeToPayment(from vc: UIViewController) {
        let paymentRouter: PaymentRouter = injection.resolve()
        paymentRouter.routeToPayment(from: vc)
    }
}
