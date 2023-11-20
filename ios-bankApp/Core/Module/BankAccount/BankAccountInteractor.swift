//
//  BankAccountInteractor.swift
//  ios-bankApp
//
//  Created by Muhammad Fahmi on 13/11/23.
//

import UIKit
import Combine


class BankAccountInteractor: BankAccountPresenterToInteractor {
    
    private let accountUseCase: AccountUseCase
    private let transUseCase: TransactionUseCase
    
    var cancelable = Set<AnyCancellable>()
    var presenter: BankAccountInteractorToPresenter?
    
    init(accountUseCase: AccountUseCase, transUseCase: TransactionUseCase) {
        self.accountUseCase = accountUseCase
        self.transUseCase = transUseCase
    }
    
    func getBankAccount() {
        accountUseCase.getAccount()
        .receive(on: RunLoop.main)
        .sink(receiveValue: { [weak self] value in
            self?.presenter?.fetchBankAccountSuccess(with: value)
        }).store(in: &cancelable)
    }
    
    func getListTransaction() {
        transUseCase.list()
            .receive(on: RunLoop.main)
            .sink(receiveValue: { [weak self] value in
                self?.presenter?.fetchTransactionListSuccess(with: value)
            }).store(in: &cancelable)
    }
    
}

