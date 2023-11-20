//
//  PromoUseCase.swift
//  ios-bankApp
//
//  Created by Muhammad Fahmi on 20/11/23.
//

import Foundation
import Combine

protocol PromoUseCase {
    func list() -> Future<[PromoEntity], Never>
    func detail(promoID: String) -> Future<PromoEntity, Never>
}

class PromoInteractorCase: PromoUseCase {
    
    private let promoRepo: PromoRepository
    
    init(promoRepo: PromoRepository) {
        self.promoRepo = promoRepo
    }
    
    func list() -> Future<[PromoEntity], Never> {
        promoRepo.getPromoList()
    }
    
    func detail(promoID: String) -> Future<PromoEntity, Never> {
        promoRepo.getPromoDetail(promoID: promoID)
    }
    
}
