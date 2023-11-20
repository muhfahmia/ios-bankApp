//
//  DefaultTransactionRepository.swift
//  ios-bankApp
//
//  Created by Muhammad Fahmi on 20/11/23.
//

import Foundation
import Combine
import Domain

public struct DefaultTransactionRepository: TransactionRepository {
    
    private let transDataSource: TransactionDataSource
    
    public init(transDataSource: TransactionDataSource) {
        self.transDataSource = transDataSource
    }
    
    public func addTransaction(payload: String) -> Future<Bool, Never> {
        transDataSource.addTransaction(payload: payload)
    }
    
    public func getTransactionPayload(payload: String) -> Future<TransactionEntity, Never> {
        transDataSource.getTransactionPayload(payload: payload)
    }
    
    public func getTransactionList() -> Future<[TransactionEntity], Never> {
        transDataSource.getTransactionList()
    }
    
}

