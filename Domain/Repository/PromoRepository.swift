//
//  PromoRepository.swift
//  ios-bankApp
//
//  Created by Muhammad Fahmi on 15/11/23.
//

import Combine

public protocol PromoRepository {
    func getPromoList() -> Future<[PromoEntity], Never>
    func getPromoDetail(promoID: String) -> Future<PromoEntity, Never>
}
