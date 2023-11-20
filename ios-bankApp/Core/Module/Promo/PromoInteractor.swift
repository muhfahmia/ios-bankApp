//
//  PromoInteractor.swift
//  ios-bankApp
//
//  Created by Muhammad Fahmi on 15/11/23.
//

import Combine
import Foundation
import Domain

class PromoInteractor: PromoPresenterToInteractor {
    
    private let promoUseCase: PromoUseCase
    var presenter: PromoInteractorToPresenter?
    
    var store = Set<AnyCancellable>()
    
    init(promoUseCase: PromoUseCase) {
        self.promoUseCase = promoUseCase
    }
    
    func fetchPromo() {
        promoUseCase.list()
            .receive(on: RunLoop.main)
            .sink(receiveValue: { [weak self] value in
                self?.presenter?.fetchPromoSuccess(promo: value)
            }).store(in: &store)
    }
    
    
}
