//
//  AppInjection.swift
//  ios-bankApp
//
//  Created by Muhammad Fahmi on 13/11/23.
//

import Foundation

protocol Injection: HomeInjection, 
                        BankAccountInjection, 
                        PaymentInjection,
                        TransactionInjection, 
                        PromoInjection,
                        PromoDetailInjection {}

final class AppInjection: Injection {}
