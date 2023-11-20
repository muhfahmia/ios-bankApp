//
//  PromoDetailInteractor.swift
//  ios-bankApp
//
//  Created by Muhammad Fahmi on 15/11/23.
//

import UIKit
import Combine

class PromoDetailInteractor: PromoDetailPresenterToInteractor {
    
    private let promoUseCase: PromoUseCase
    var presenter: PromoDetailInteractorToPresenter?
    var store = Set<AnyCancellable>()

    init(promoUseCase: PromoUseCase) {
        self.promoUseCase = promoUseCase
    }
    
    func fetchDetail(promoID: String) {
        promoUseCase.detail(promoID: promoID)
        .receive(on: RunLoop.main)
        .sink(receiveValue: { [weak self] value in
            self?.presenter?.fetchDetailSuccess(promo: value)
        }).store(in: &store)
    }
}
