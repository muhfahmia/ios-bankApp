//
//  TransactionDataSource.swift
//  ios-bankApp
//
//  Created by Muhammad Fahmi on 15/11/23.
//

import RealmSwift
import Combine

protocol TransactionDataSource {
    func addTransaction(payload: String) -> Future<Bool, Never>
    func getTransactionPayload(payload: String) -> Future<TransactionEntity, Never>
    func getTransactionList() -> Future<[TransactionEntity], Never>
}

struct DefaultTransactionDataSource: TransactionDataSource {
    
    private let realm: Realm?
    
    init(realm: Realm?) {
        self.realm = realm
    }
    
    func addTransaction(payload: String) -> Future<Bool, Never> {
        return Future<Bool, Never> { promise in
            let bankAccount = realm?.objects(BankAccountModel.self).first
            guard let bankAccount = bankAccount else { return promise (.success(false))}
            let transaction = TransactionModel()
            transaction.mappingPayloadToModel(payload: payload)
            let balanceUpdate = bankAccount.accountBalance! - (transaction.amount ?? 0)
            do {
                try realm?.write {
                    bankAccount.accountBalance = balanceUpdate
                    realm?.add(bankAccount, update: .modified)
                    realm?.add(transaction)
                }
                promise(.success(true))
            } catch {
                promise(.success(false))
            }
        }
    }
    
    func getTransactionPayload(payload: String) -> Future<TransactionEntity, Never> {
        return Future<TransactionEntity, Never> { promise in
            let transaction = TransactionModel()
            transaction.mappingPayloadToModel(payload: payload)
            promise(.success(transaction))
        }
    }
    
    func getTransactionList() -> Future<[TransactionEntity], Never> {
        return Future<[TransactionEntity], Never> { promise in
            let transaction = realm?.objects(TransactionModel.self)
            guard let trans = transaction else { return }
            let transArray = Array(trans)
            promise(.success(transArray))
        }
    }
}
