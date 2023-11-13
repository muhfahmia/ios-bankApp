//
//  BankAccountInjection.swift
//  ios-bankApp
//
//  Created by Muhammad Fahmi on 13/11/23.
//
import UIKit

protocol BankAccountInjection {
    func resolve() -> BankAccountViewController
    func resolve() -> BankAccountRouter
}

extension BankAccountInjection where Self: Injection {
    
    func resolve() -> BankAccountViewController {
        return BankAccountViewController()
    }
    
    func resolve() -> BankAccountRouter {
        return DefaultBankAccountRouter(injection: self)
    }
}
