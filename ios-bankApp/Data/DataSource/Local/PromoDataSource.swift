//
//  PromoDataSource.swift
//  ios-bankApp
//
//  Created by Muhammad Fahmi on 15/11/23.
//

import Combine

protocol PromoDataSource {
    func getPromoFromSource() -> Future<[PromoEntity], Never>
    func getPromoDetailFromSource(promoID: String) -> Future<PromoEntity, Never>
}

struct DefaultPromoDataSource: PromoDataSource {
    
    func getPromoFromSource() -> Future<[PromoEntity], Never> {
        return Future<[PromoEntity], Never> { promise in
            promise(.success(PromoModel.promoData))
        }
    }
    
    func getPromoDetailFromSource(promoID: String) -> Future<PromoEntity, Never> {
        return Future<PromoEntity, Never> { promise in
            guard let promo = PromoModel.promoData.filter({ $0.promoID == promoID }).first else { return print("unknown model") }
            promise(.success(promo))
        }
    }
}
