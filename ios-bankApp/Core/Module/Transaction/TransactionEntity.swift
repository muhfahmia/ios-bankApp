//
//  TransactionEntity.swift
//  ios-bankApp
//
//  Created by Muhammad Fahmi on 15/11/23.
//

protocol TransactionEntity {
    var transID: String? { get }
    var bankName: String? { get }
    var merchant: String? { get }
    var amount: Double? { get }
    var paymentDate: String? { get }
}
