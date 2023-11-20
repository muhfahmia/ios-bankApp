//
//  DefaultTransactionRepository.swift
//  ios-bankApp
//
//  Created by Muhammad Fahmi on 20/11/23.
//

import Foundation
import Combine

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
    
    func getTransactionList() -> Future<[TransactionModel], Never> {
        transDataSource.getTransactionList()
    }
    
}

