//
//  PromoInteractor.swift
//  ios-bankApp
//
//  Created by Muhammad Fahmi on 15/11/23.
//

import Combine
import Foundation

class PromoInteractor: PromoPresenterToInteractor {
    
    private let promoRepo: PromoRepository
    var presenter: PromoInteractorToPresenter?
    
    var store = Set<AnyCancellable>()
    
    init(promoRepo: PromoRepository) {
        self.promoRepo = promoRepo
    }
    
    func fetchPromo() {
        print("fetchPromoInteractor")
        promoRepo.getPromoList()
            .receive(on: RunLoop.main)
            .sink(receiveValue: { [weak self] value in
                self?.presenter?.fetchPromoSuccess(promo: value)
            }).store(in: &store)
    }
    
    
}
