//
//  DefaultPromoRepository.swift
//  ios-bankApp
//
//  Created by Muhammad Fahmi on 20/11/23.
//

import Foundation
import Combine
import Domain

public struct DefaultPromoRepository: PromoRepository {
    
    private let promoSoruce: PromoDataSource
    
    public init(promoSource: PromoDataSource) {
        self.promoSoruce = promoSource
    }
    
    public func getPromoList() -> Future<[PromoEntity], Never> {
        promoSoruce.getPromoFromSource()
    }
    
    public func getPromoDetail(promoID: String) -> Future<PromoEntity, Never> {
        promoSoruce.getPromoDetailFromSource(promoID: promoID)
    }
    
}
