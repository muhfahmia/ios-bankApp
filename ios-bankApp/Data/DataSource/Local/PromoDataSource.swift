//
//  PromoDataSource.swift
//  ios-bankApp
//
//  Created by Muhammad Fahmi on 15/11/23.
//

import Combine

protocol PromoDataSource {
    func getPromoFromSource() -> Future<[PromoModel], Never>
    func getPromoDetailFromSource(promoID: String) -> Future<PromoModel, Never>
}

struct DefaultPromoDataSource: PromoDataSource {
    
    func getPromoFromSource() -> Future<[PromoModel], Never> {
        return Future<[PromoModel], Never> { promise in
            promise(.success(PromoModel.promoData))
        }
    }
    
    func getPromoDetailFromSource(promoID: String) -> Future<PromoModel, Never> {
        return Future<PromoModel, Never> { promise in
            guard let promo = PromoModel.promoData.filter({ $0.promoID == promoID }).first else { return print("unknown model") }
            promise(.success(promo))
        }
    }
    
}
