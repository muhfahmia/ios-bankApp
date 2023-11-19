//
//  PaymentRouter.swift
//  ios-bankApp
//
//  Created by Muhammad Fahmi on 14/11/23.
//

import UIKit

protocol PaymentRouter {
    func pushToPayment(from vc: UIViewController)
    func routeToTransaction(vc: UIViewController, payload: String)
}

struct DefaultPaymentRouter: PaymentRouter {
    
    private let injection: Injection
    
    init(injection: Injection) {
        self.injection = injection
    }
    
    func pushToPayment(from vc: UIViewController) {
        let paymentVC: PaymentViewController = injection.resolve()
        paymentVC.hidesBottomBarWhenPushed = true
        paymentVC.navigationController?.isNavigationBarHidden = true
        vc.navigationController?.pushViewController(paymentVC, animated: true)
    }
    
    func routeToTransaction(vc: UIViewController, payload: String) {
        let transactionRouter: TransactionRouter = injection.resolve()
        transactionRouter.pushToTransaction(from: vc, payload: payload)
    }
    
}
