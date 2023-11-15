//
//  PromoInjection.swift
//  ios-bankApp
//
//  Created by Muhammad Fahmi on 15/11/23.
//

protocol PromoInjection {
    func resolve() -> PromoViewController
}

extension PromoInjection where Self: Injection {
    
    func resolve() -> PromoViewController {
        return PromoViewController()
    }
    
}
