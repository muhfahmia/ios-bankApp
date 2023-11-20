//
//  BankAccountRepository.swift
//  ios-bankApp
//
//  Created by Muhammad Fahmi on 13/11/23.
//

import Combine

protocol BankAccountRepository {
    func getAccount() -> Future<BankAccountEntity, Never>
    func addAccount() -> Future<Bool, Error>
}
