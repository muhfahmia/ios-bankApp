//
//  PaymentRouter.swift
//  ios-bankApp
//
//  Created by Muhammad Fahmi on 14/11/23.
//

import UIKit

protocol PaymentRouter {
    func routeToPayment(from vc: UIViewController)
}

struct DefaultPaymentRouter: PaymentRouter {
    
    private let injection: Injection
    
    init(injection: Injection) {
        self.injection = injection
    }
    
    func routeToPayment(from vc: UIViewController) {
        let paymentVC: PaymentViewController = injection.resolve()
        paymentVC.hidesBottomBarWhenPushed = true
        paymentVC.navigationController?.isNavigationBarHidden = true
        vc.navigationController?.pushViewController(paymentVC, animated: true)
    }
    
}
