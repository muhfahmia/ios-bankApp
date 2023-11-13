//
//  BankAccountRepository.swift
//  ios-bankApp
//
//  Created by Muhammad Fahmi on 13/11/23.
//

import Combine

protocol BankAccountRepository {
    func getAccount() -> Future<BankAccount, Error>
}

struct DefaultBankAccount: BankAccountRepository {
    
    private let bankAccountSource: BankAccountDataSource
    
    init(bankAccountSource: BankAccountDataSource) {
        self.bankAccountSource = bankAccountSource
    }
    
    func getAccount() -> Future<BankAccount, Error> {
        return bankAccountSource.getAccount()
    }
    
}
