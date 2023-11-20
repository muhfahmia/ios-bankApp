//
//  TransactionContract.swift
//  ios-bankApp
//
//  Created by Muhammad Fahmi on 14/11/23.
//

import UIKit
import Combine
import Domain

protocol TransactionViewToPresenter {
    var view: TransactionPresenterToView? { get set }
    var interactor: TransactionPresenterToInteractor? { get set }
    var router: TransactionRouter? { get set }
    var transEntity: TransactionEntity? { get set }
    func viewDidLoad(payload: String)
}

protocol TransactionPresenterToView {
    var paymentSubmit: UIButton! { get set }
    func onGetTransactionPayloadSuccess()
    func onTransactionSuccess()
    func onTransactionFailed()
}

protocol TransactionPresenterToInteractor {
    var presenter: TransactionInteractorToPresenter? { get set }
    func addTransaction(payload: String)
    func getTransactionPayload(payload: String)
}

protocol TransactionInteractorToPresenter {
    func getPayloadSuccess(entity: TransactionEntity)
    func transactionSuccess()
    func transactionFail()
}
