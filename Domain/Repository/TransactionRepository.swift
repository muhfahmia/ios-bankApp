//
//  TransactionRepository.swift
//  ios-bankApp
//
//  Created by Muhammad Fahmi on 15/11/23.
//

import Combine

public protocol TransactionRepository {
    func addTransaction(payload: String) -> Future<Bool, Never>
    func getTransactionPayload(payload: String) -> Future<TransactionEntity, Never>
    func getTransactionList() -> Future<[TransactionEntity], Never>
}
