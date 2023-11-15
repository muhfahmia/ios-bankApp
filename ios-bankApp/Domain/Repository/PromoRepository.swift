//
//  PromoRepository.swift
//  ios-bankApp
//
//  Created by Muhammad Fahmi on 15/11/23.
//

import Combine

protocol PromoRepository {
    func getPromoList() -> Future<[PromoModel], Never>
    func getPromoDetail(promoID: String) -> Future<PromoModel, Never>
}

struct DefaultPromoRepository: PromoRepository {
    
    private let promoSoruce: PromoDataSource
    
    init(promoSource: PromoDataSource) {
        self.promoSoruce = promoSource
    }
    
    func getPromoList() -> Future<[PromoModel], Never> {
        promoSoruce.getPromoFromSource()
    }
    
    func getPromoDetail(promoID: String) -> Future<PromoModel, Never> {
        promoSoruce.getPromoDetailFromSource(promoID: promoID)
    }
    
}
