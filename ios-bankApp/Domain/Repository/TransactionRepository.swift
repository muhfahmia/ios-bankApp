//
//  TransactionRepository.swift
//  ios-bankApp
//
//  Created by Muhammad Fahmi on 15/11/23.
//

import Combine

protocol TransactionRepository {
    func addTransaction(payload: String) -> Future<Bool, Never>
    func getTransactionPayload(payload: String) -> Future<TransactionModel, Never>
    func getTransactionList() -> Future<[TransactionModel], Never>
}
