//
//  BankAccountDataSource.swift
//  ios-bankApp
//
//  Created by Muhammad Fahmi on 13/11/23.
//

import RealmSwift
import Combine

protocol BankAccountDataSource {
    func addAccount() -> Future<Bool, Error>
    func getAccount() -> Future<BankAccountEntity, Never>
}

struct DefaultBankAccountDataSource: BankAccountDataSource {
    
    private let realm: Realm?
    
    init(realm: Realm?) {
        self.realm = realm
    }
    
    func addAccount() -> Future<Bool, Error> {
        return Future<Bool, Error> { promise in
            let myAccount = BankAccountModel()
            myAccount.accountNumber = "123456789"
            myAccount.accountName = "Fahmi"
            myAccount.accountBalance = 10000000
            let topUpTransaction = TransactionModel()
            topUpTransaction.amount = 10000000
            topUpTransaction.transID = "IDTOPUP12345"
            topUpTransaction.merchant = "TOPUP SALDO"
            topUpTransaction.bankName = "BNI"
            topUpTransaction.type = "IN"
            do {
                try realm?.write {
                    realm?.add(myAccount)
                    realm?.add(topUpTransaction)
                }
                promise(.success(true))
            } catch {
                promise(.failure(LocalError.invalidRealm))
            }
        }
    }
    
    func getAccount() -> Future<BankAccountEntity, Never> {
        return Future<BankAccountEntity, Never> { promise in
            if let realm = self.realm {
                var account = realm.objects(BankAccountModel.self)
                if account.isEmpty {
                    _ = addAccount()
                }
                account = realm.objects(BankAccountModel.self)
                guard let accountFirst: BankAccountEntity = account.first else { return }
                promise(.success(accountFirst))
            }
        }
    }
    
}
