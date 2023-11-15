//
//  PaymentContract.swift
//  ios-bankApp
//
//  Created by Muhammad Fahmi on 14/11/23.
//

import UIKit
import Combine

protocol PaymentViewToPresenter {
    var view: PaymentPresenterToView? { get set }
    var router: PaymentRouter? { get set }
    func viewDidLoad()
    func doPay(vc: UIViewController, payload: String)
}

protocol PaymentPresenterToView {
    var presenter: PaymentViewToPresenter? { get set }
    func popUpDeniedAlert(alert: UIAlertController)
    func popNavigationController()
    func setupCamera()
}
