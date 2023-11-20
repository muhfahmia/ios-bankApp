//
//  TransactionInteractor.swift
//  ios-bankApp
//
//  Created by Muhammad Fahmi on 15/11/23.
//

import Combine
import Foundation

class TransactionInteractor: TransactionPresenterToInteractor {
    
    var presenter: TransactionInteractorToPresenter?
    private let transUseCase: TransactionUseCase
    var store = Set<AnyCancellable>()
    
    init(transUseCase: TransactionUseCase) {
        self.transUseCase = transUseCase
    }
    
    func addTransaction(payload: String) {
        transUseCase.add(payload: payload)
        .receive(on: RunLoop.main)
        .sink(receiveCompletion: { _ in
        }, receiveValue: { [weak self] value in
            self?.presenter?.transactionSuccess()
        }).store(in: &store)
    }
    
    func getTransactionPayload(payload: String) {
        transUseCase.getPayload(payload: payload)
        .receive(on: RunLoop.main)
        .sink(receiveCompletion: { _ in
        }, receiveValue: { value in
            self.presenter?.getPayloadSuccess(entity: value)
        }).store(in: &store)
    }
}
