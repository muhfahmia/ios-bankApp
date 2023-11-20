//
//  BankAccountEntity.swift
//  ios-bankApp
//
//  Created by Muhammad Fahmi on 20/11/23.
//

import Foundation

public protocol BankAccountEntity {
    var accountID: String { get }
    var accountNumber: String? { get }
    var accountName: String? { get }
    var accountBalance: Double? { get }
}
