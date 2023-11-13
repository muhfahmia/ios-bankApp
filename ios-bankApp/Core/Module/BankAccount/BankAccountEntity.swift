//
//  BalanceEntity.swift
//  ios-bankApp
//
//  Created by Muhammad Fahmi on 13/11/23.
//

import Foundation

protocol BankAccount {
    var accountID: String { get }
    var accountNumber: String? { get }
    var accountName: String? { get }
    var accountBalance: Double? { get }
}
