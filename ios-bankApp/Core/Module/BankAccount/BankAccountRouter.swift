//
//  HomeRouter.swift
//  ios-bankApp
//
//  Created by Muhammad Fahmi on 13/11/23.
//

import UIKit

protocol BankAccountRouter {
    
}

struct DefaultBankAccountRouter: BankAccountRouter {
    
    private let injection: Injection
    
    init(injection: Injection) {
        self.injection = injection
    }
}
