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
