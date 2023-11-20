//
//  PromoDetailPresenter.swift
//  ios-bankApp
//
//  Created by Muhammad Fahmi on 15/11/23.
//

import UIKit
import Domain

class PromoDetailPresenter: PromoDetailViewToPresenter {
    var view: PromoDetailPresenterToView?
    var interactor: PromoDetailPresenterToInteractor?
    var router: PromoDetailRouter?
    var promoID: String?
    
    func viewDidLoad() {
        interactor?.fetchDetail(promoID: promoID ?? "promo-1")
    }
}

extension PromoDetailPresenter: PromoDetailInteractorToPresenter {
    func fetchDetailSuccess(promo: PromoEntity) {
        view?.updateFetchDetailSuccess(promo: promo)
    }
}
