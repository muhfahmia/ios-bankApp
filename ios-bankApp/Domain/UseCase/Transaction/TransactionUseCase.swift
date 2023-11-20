//
//  TransactionUseCase.swift
//  ios-bankApp
//
//  Created by Muhammad Fahmi on 20/11/23.
//

import Foundation
import Combine

protocol TransactionUseCase {
    func list() -> Future<[TransactionEntity], Never>
    func add(payload: String) -> Future<Bool, Never>
    func getPayload(payload: String) -> Future<TransactionEntity, Never>
}

class TransactionCaseInteractor: TransactionUseCase {
    
    private let transRepo: TransactionRepository
    
    init(transRepo: TransactionRepository) {
        self.transRepo = transRepo
    }
    
    func list() -> Future<[TransactionEntity], Never> {
        transRepo.getTransactionList()
    }
    
    func add(payload: String) -> Future<Bool, Never> {
        transRepo.addTransaction(payload: payload)
    }
    
    func getPayload(payload: String) -> Future<TransactionEntity, Never> {
        transRepo.getTransactionPayload(payload: payload)
    }
    
}
