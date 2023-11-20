//
//  TransactionUseCase.swift
//  ios-bankApp
//
//  Created by Muhammad Fahmi on 20/11/23.
//

import Foundation
import Combine

public protocol TransactionUseCase {
    func list() -> Future<[TransactionEntity], Never>
    func add(payload: String) -> Future<Bool, Never>
    func getPayload(payload: String) -> Future<TransactionEntity, Never>
}

public class TransactionCaseInteractor: TransactionUseCase {
    
    private let transRepo: TransactionRepository
    
    public init(transRepo: TransactionRepository) {
        self.transRepo = transRepo
    }
    
    public func list() -> Future<[TransactionEntity], Never> {
        transRepo.getTransactionList()
    }
    
    public func add(payload: String) -> Future<Bool, Never> {
        transRepo.addTransaction(payload: payload)
    }
    
    public func getPayload(payload: String) -> Future<TransactionEntity, Never> {
        transRepo.getTransactionPayload(payload: payload)
    }
    
}
