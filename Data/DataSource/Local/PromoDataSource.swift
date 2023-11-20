//
//  PromoDataSource.swift
//  ios-bankApp
//
//  Created by Muhammad Fahmi on 15/11/23.
//

import Combine
import Domain

public protocol PromoDataSource {
    func getPromoFromSource() -> Future<[PromoEntity], Never>
    func getPromoDetailFromSource(promoID: String) -> Future<PromoEntity, Never>
}

public struct DefaultPromoDataSource: PromoDataSource {
    
    public init() {}
    
    public func getPromoFromSource() -> Future<[PromoEntity], Never> {
        return Future<[PromoEntity], Never> { promise in
            promise(.success(PromoModel.promoData))
        }
    }
    
    public func getPromoDetailFromSource(promoID: String) -> Future<PromoEntity, Never> {
        return Future<PromoEntity, Never> { promise in
            guard let promo = PromoModel.promoData.filter({ $0.promoID == promoID }).first else { return print("unknown model") }
            promise(.success(promo))
        }
    }
}
