//
//  BankAccountInteractor.swift
//  ios-bankApp
//
//  Created by Muhammad Fahmi on 13/11/23.
//

import UIKit
import Combine


class BankAccountInteractor: BankAccountUseCase {
    
    private let repository: BankAccountRepository
    
    var cancelable = Set<AnyCancellable>()
    
    init(repository: BankAccountRepository) {
        self.repository = repository
    }
    
    func getAccount() {
        repository.getAccount()
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { _ in
                
            }, receiveValue: { [weak self] value in
                
            }).store(in: &cancelable)
    }
    
}

