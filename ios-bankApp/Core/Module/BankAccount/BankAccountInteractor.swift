//
//  BankAccountInteractor.swift
//  ios-bankApp
//
//  Created by Muhammad Fahmi on 13/11/23.
//

import UIKit
import Combine


class BankAccountInteractor: BankAccountPresenterToInteractor {
    
    private let repository: BankAccountRepository
    var cancelable = Set<AnyCancellable>()
    var presenter: BankAccountInteractorToPresenter?
    
    init(repository: BankAccountRepository) {
        self.repository = repository
    }
    
    func getBankAccount() {
        repository.getAccount()
        .receive(on: RunLoop.main)
        .sink(receiveValue: { [weak self] value in
            self?.presenter?.fetchBankAccountSuccess(with: value)
        }).store(in: &cancelable)
    }
    
    func addBankAccount() {
        repository.addAccount()
        .receive(on: RunLoop.main)
        .sink(receiveCompletion: { _ in
        }, receiveValue: { value in
            print(value)
        }).store(in: &cancelable)
    }
    
}

