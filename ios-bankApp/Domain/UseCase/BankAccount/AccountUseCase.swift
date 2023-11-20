//
//  GetAccountUseCase.swift
//  ios-bankApp
//
//  Created by Muhammad Fahmi on 20/11/23.
//

import Foundation
import Combine

protocol AccountUseCase {
    func getAccount() -> Future<BankAccountEntity, Never>
}

class AccountInteractor: AccountUseCase {
    
    private let accountRepo: BankAccountRepository
    
    init(repo: BankAccountRepository) {
        self.accountRepo = repo
    }
    
    func getAccount() -> Future<BankAccountEntity, Never> {
        accountRepo.getAccount()
    }
    
}
