//
//  HomeRouter.swift
//  ios-bankApp
//
//  Created by Muhammad Fahmi on 13/11/23.
//

import UIKit

protocol BankAccountRouter {
    func routeToPayment(from vc: UIViewController)
    func routeToTransaction(from vc: UIViewController, payload: String)
}

struct DefaultBankAccountRouter: BankAccountRouter {
    
    private let injection: Injection
    
    init(injection: Injection) {
        self.injection = injection
    }
    
    func routeToPayment(from vc: UIViewController) {
        let paymentRouter: PaymentRouter = injection.resolve()
        paymentRouter.pushToPayment(from: vc)
    }
    
    func routeToTransaction(from vc: UIViewController, payload: String) {
        let transactionRouter: TransactionRouter = injection.resolve()
        transactionRouter.pushToTransaction(from: vc, payload: payload)
    }
}
