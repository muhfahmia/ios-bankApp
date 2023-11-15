//
//  PromoDetailInteractor.swift
//  ios-bankApp
//
//  Created by Muhammad Fahmi on 15/11/23.
//

import UIKit
import Combine

class PromoDetailInteractor: PromoDetailPresenterToInteractor {
    
    private let promoRepo: PromoRepository
    var presenter: PromoDetailInteractorToPresenter?
    var store = Set<AnyCancellable>()

    init(promoRepo: PromoRepository) {
        self.promoRepo = promoRepo
    }
    
    func fetchDetail(promoID: String) {
        promoRepo.getPromoDetail(promoID: promoID)
        .receive(on: RunLoop.main)
        .sink(receiveValue: { [weak self] value in
            self?.presenter?.fetchDetailSuccess(promo: value)
        }).store(in: &store)
    }
}
