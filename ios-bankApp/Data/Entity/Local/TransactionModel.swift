//
//  TransactionModel.swift
//  ios-bankApp
//
//  Created by Muhammad Fahmi on 15/11/23.
//

import RealmSwift
import Foundation

class TransactionModel: Object, TransactionEntity {
    @Persisted(primaryKey: true) var transModelID: String = UUID().uuidString
    @Persisted var transID: String?
    @Persisted var bankName: String?
    @Persisted var merchant: String?
    @Persisted var amount: Double?
    @Persisted var paymentDate: String? = Date().string(withFormat: "Y-MM-dd HH:mm")
    
    override class func primaryKey() -> String? {
        return "transModelID"
    }
    
    func mappingPayloadToModel(payload: String) {
        let payloads = payload.components(separatedBy: ".")
        self.transID = payloads[1]
        self.bankName = payloads[0]
        self.merchant = payloads[2]
        self.amount = Double(payloads[3])
    }
    
}
