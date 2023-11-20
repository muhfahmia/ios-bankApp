//
//  BankAccountEntity.swift
//  ios-bankApp
//
//  Created by Muhammad Fahmi on 20/11/23.
//

import Foundation

protocol BankAccountEntity {
    var accountID: String { get }
    var accountNumber: String? { get }
    var accountName: String? { get }
    var accountBalance: Double? { get }
}
