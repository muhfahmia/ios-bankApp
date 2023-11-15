//
//  BankAccountInteractor.swift
//  ios-bankApp
//
//  Created by Muhammad Fahmi on 13/11/23.
//

import UIKit
import Combine


class BankAccountInteractor: BankAccountPresenterToInteractor {
    
    private let bankRepo: BankAccountRepository
    private let transRepo: TransactionRepository
    
    var cancelable = Set<AnyCancellable>()
    var presenter: BankAccountInteractorToPresenter?
    
    init(bankRepo: BankAccountRepository, transRepo: TransactionRepository) {
        self.bankRepo = bankRepo
        self.transRepo = transRepo
    }
    
    func getBankAccount() {
        bankRepo.getAccount()
        .receive(on: RunLoop.main)
        .sink(receiveValue: { [weak self] value in
            self?.presenter?.fetchBankAccountSuccess(with: value)
        }).store(in: &cancelable)
    }
    
    func addBankAccount() {
        bankRepo.addAccount()
        .receive(on: RunLoop.main)
        .sink(receiveCompletion: { _ in
        }, receiveValue: { value in
            print(value)
        }).store(in: &cancelable)
    }
    
    func getListTransaction() {
        transRepo.getTransactionList()
            .receive(on: RunLoop.main)
            .sink(receiveValue: { [weak self] value in
                self?.presenter?.fetchTransactionListSuccess(with: value)
            }).store(in: &cancelable)
    }
    
}

