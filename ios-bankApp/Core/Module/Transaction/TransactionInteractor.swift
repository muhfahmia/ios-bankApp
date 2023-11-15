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
    private let transRepo: TransactionRepository
    var store = Set<AnyCancellable>()
    
    init(transRepo: TransactionRepository) {
        self.transRepo = transRepo
    }
    
    func addTransaction(payload: String) {
        transRepo.addTransaction(payload: payload)
        .receive(on: RunLoop.main)
        .sink(receiveCompletion: { _ in
        }, receiveValue: { value in
            print(value)
        }).store(in: &store)
    }
    
    func getTransactionPayload(payload: String) {
        transRepo.getTransactionPayload(payload: payload)
        .receive(on: RunLoop.main)
        .sink(receiveCompletion: { _ in
        }, receiveValue: { value in
            self.presenter?.getPayloadSuccess(entity: value)
        }).store(in: &store)
    }
}
