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
    func getAccount() -> Future<BankAccountModel, Error>
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
            do {
                try realm?.write {
                    realm?.add(myAccount)
                }
                promise(.success(true))
            } catch {
                promise(.failure(ErrorDescription.invalidRealm))
            }
        }
    }
    
    func getAccount() -> Future<BankAccountModel, Error> {
        return Future<BankAccountModel, Error> { promise in
            if let realm = self.realm {
                let account = realm.objects(BankAccountModel.self)
                if account.isEmpty {
                    promise(.failure(ErrorDescription.invalidRealm))
                } else {
                    promise(.success(account.first!))
                }
            }
        }
    }
    
}
