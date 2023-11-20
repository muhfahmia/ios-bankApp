//
//  TransactionPresenter.swift
//  ios-bankApp
//
//  Created by Muhammad Fahmi on 15/11/23.
//

import Foundation
import UIKit
import Domain

class TransactionPresenter: TransactionViewToPresenter {
    var paymentSubmit: UIButton?
    var payload: String?
    var view: TransactionPresenterToView?
    var interactor: TransactionPresenterToInteractor?
    var router: TransactionRouter?
    
    var transEntity: TransactionEntity?
    
    func viewDidLoad(payload: String) {
        
        view?.paymentSubmit?.addAction(UIAction(handler: { [weak self] _ in
            self?.interactor?.addTransaction(payload: payload)
        }), for: .touchUpInside)
        
        _ = interactor?.getTransactionPayload(payload: payload)
    }
}

extension TransactionPresenter: TransactionInteractorToPresenter {
    
    func getPayloadSuccess(entity: TransactionEntity) {
        self.transEntity = entity
        view?.onGetTransactionPayloadSuccess()
    }
    
    func transactionSuccess() {
        view?.onTransactionSuccess()
    }
    
    func transactionFail() {
        view?.onTransactionFailed()
    }
    
}
