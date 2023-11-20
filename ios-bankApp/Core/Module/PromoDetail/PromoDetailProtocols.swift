//
//  PromoDetailProtocols.swift
//  ios-bankApp
//
//  Created by Muhammad Fahmi on 15/11/23.
//

import UIKit
import Domain

protocol PromoDetailViewToPresenter {
    var view: PromoDetailPresenterToView? { get set }
    var interactor: PromoDetailPresenterToInteractor? { get set }
    var router: PromoDetailRouter? { get set }
    var promoID: String? { get set }
    func viewDidLoad()
}

protocol PromoDetailPresenterToView {
    func updateFetchDetailSuccess(promo: PromoEntity)
}

protocol PromoDetailPresenterToInteractor {
    var presenter: PromoDetailInteractorToPresenter? { get set }
    func fetchDetail(promoID: String)
}

protocol PromoDetailInteractorToPresenter {
    func fetchDetailSuccess(promo: PromoEntity)
}
