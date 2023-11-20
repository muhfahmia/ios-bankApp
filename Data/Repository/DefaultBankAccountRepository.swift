//
//  DefaultBankAccountRepository.swift
//  ios-bankApp
//
//  Created by Muhammad Fahmi on 20/11/23.
//

import Foundation
import Combine
import Domain

public struct DefaultBankAccount: BankAccountRepository {
    
    private let bankAccountSource: BankAccountDataSource
    
    public init(bankAccountSource: BankAccountDataSource) {
        self.bankAccountSource = bankAccountSource
    }
    
    public func getAccount() -> Future<BankAccountEntity, Never> {
        return bankAccountSource.getAccount()
    }
    
    public func addAccount() -> Future<Bool, Error> {
        return bankAccountSource.addAccount()
    }
    
}
