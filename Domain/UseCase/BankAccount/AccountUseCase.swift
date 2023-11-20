//
//  GetAccountUseCase.swift
//  ios-bankApp
//
//  Created by Muhammad Fahmi on 20/11/23.
//

import Foundation
import Combine

public protocol AccountUseCase {
    func getAccount() -> Future<BankAccountEntity, Never>
}

public class AccountInteractor: AccountUseCase {
    
    private let accountRepo: BankAccountRepository
    
    public init(repo: BankAccountRepository) {
        self.accountRepo = repo
    }
    
    public func getAccount() -> Future<BankAccountEntity, Never> {
        accountRepo.getAccount()
    }
    
}
