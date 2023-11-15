//
//  BankAccountRepository.swift
//  ios-bankApp
//
//  Created by Muhammad Fahmi on 13/11/23.
//

import Combine

protocol BankAccountRepository {
    func getAccount() -> Future<BankAccountModel, Never>
    func addAccount() -> Future<Bool, Error>
}

struct DefaultBankAccount: BankAccountRepository {
    
    private let bankAccountSource: BankAccountDataSource
    
    init(bankAccountSource: BankAccountDataSource) {
        self.bankAccountSource = bankAccountSource
    }
    
    func getAccount() -> Future<BankAccountModel, Never> {
        return bankAccountSource.getAccount()
    }
    
    func addAccount() -> Future<Bool, Error> {
        return bankAccountSource.addAccount()
    }
    
}
