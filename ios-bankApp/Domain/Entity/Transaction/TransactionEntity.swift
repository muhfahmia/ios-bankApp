//
//  TransactionEntity.swift
//  ios-bankApp
//
//  Created by Muhammad Fahmi on 20/11/23.
//

import Foundation

protocol TransactionEntity {
    var transID: String? { get }
    var bankName: String? { get }
    var merchant: String? { get }
    var amount: Double? { get }
    var paymentDate: String? { get }
    var type: String? { get }
}
