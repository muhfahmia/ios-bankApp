//
//  PromoUseCase.swift
//  ios-bankApp
//
//  Created by Muhammad Fahmi on 20/11/23.
//

import Foundation
import Combine

public protocol PromoUseCase {
    func list() -> Future<[PromoEntity], Never>
    func detail(promoID: String) -> Future<PromoEntity, Never>
}

public class PromoInteractorCase: PromoUseCase {
    
    private let promoRepo: PromoRepository
    
    public init(promoRepo: PromoRepository) {
        self.promoRepo = promoRepo
    }
    
    public func list() -> Future<[PromoEntity], Never> {
        promoRepo.getPromoList()
    }
    
    public func detail(promoID: String) -> Future<PromoEntity, Never> {
        promoRepo.getPromoDetail(promoID: promoID)
    }
    
}
