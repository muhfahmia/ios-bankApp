//
//  BankAccountEntity.swift
//  ios-bankApp
//
//  Created by Muhammad Fahmi on 13/11/23.
//

import RealmSwift

class BankAccountModel: Object, BankAccountEntity {
    @Persisted(primaryKey: true) var accountID: String = UUID().uuidString
    @Persisted var accountNumber: String?
    @Persisted var accountName: String?
    @Persisted var accountBalance: Double?
    
    override class func primaryKey() -> String? {
        return "accountID"
    }
}
