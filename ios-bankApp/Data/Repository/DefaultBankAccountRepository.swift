//
//  DefaultBankAccountRepository.swift
//  ios-bankApp
//
//  Created by Muhammad Fahmi on 20/11/23.
//

import Foundation
import Combine

struct DefaultBankAccount: BankAccountRepository {
    
    private let bankAccountSource: BankAccountDataSource
    
    init(bankAccountSource: BankAccountDataSource) {
        self.bankAccountSource = bankAccountSource
    }
    
    func getAccount() -> Future<BankAccountEntity, Never> {
        return bankAccountSource.getAccount()
    }
    
    func addAccount() -> Future<Bool, Error> {
        return bankAccountSource.addAccount()
    }
    
}
