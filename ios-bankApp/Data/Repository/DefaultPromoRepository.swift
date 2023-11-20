//
//  DefaultPromoRepository.swift
//  ios-bankApp
//
//  Created by Muhammad Fahmi on 20/11/23.
//

import Foundation
import Combine

struct DefaultPromoRepository: PromoRepository {
    
    private let promoSoruce: PromoDataSource
    
    init(promoSource: PromoDataSource) {
        self.promoSoruce = promoSource
    }
    
    func getPromoList() -> Future<[PromoEntity], Never> {
        promoSoruce.getPromoFromSource()
    }
    
    func getPromoDetail(promoID: String) -> Future<PromoEntity, Never> {
        promoSoruce.getPromoDetailFromSource(promoID: promoID)
    }
    
}
