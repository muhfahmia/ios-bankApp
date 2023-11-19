//
//  TransactionRouter.swift
//  ios-bankApp
//
//  Created by Muhammad Fahmi on 14/11/23.
//

import UIKit

protocol TransactionRouter {
    func pushToTransaction(from vc: UIViewController, payload: String)
}

class DefaultTransactionRouter: TransactionRouter {
    
    private let injection: Injection
    
    init(injection: Injection) {
        self.injection = injection
    }
    
    func pushToTransaction(from vc: UIViewController, payload: String) {
        let transVC: TransactionViewController = injection.resolve(payload: payload)
        transVC.hidesBottomBarWhenPushed = true
        transVC.navigationController?.navigationBar.isHidden = true
        vc.navigationController?.pushViewController(transVC, animated: true)
    }
    
}
