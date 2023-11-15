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
}

struct DefaultTransactionRepository: TransactionRepository {
    
    private let transDataSource: TransactionDataSource
    
    init(transDataSource: TransactionDataSource) {
        self.transDataSource = transDataSource
    }
    
    func addTransaction(payload: String) -> Future<Bool, Never> {
        transDataSource.addTransaction(payload: payload)
    }
    
    func getTransactionPayload(payload: String) -> Future<TransactionModel, Never> {
        transDataSource.getTransactionPayload(payload: payload)
    }
    
}
