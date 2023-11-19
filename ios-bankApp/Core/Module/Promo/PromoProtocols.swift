//
//  PromoProtocols.swift
//  ios-bankApp
//
//  Created by Muhammad Fahmi on 15/11/23.
//

import UIKit

protocol PromoViewToPresenter {
    var view: PromoPresenterToView? { get set }
    var interactor: PromoPresenterToInteractor? { get set }
    var router: PromoRouter? { get set }
    var promoEntity: [PromoEntity]? { get set }
    func viewDidLoad()
    func promoCell(tableView: UITableView, indexPath: IndexPath) -> PromoTableViewCell
    func didSelectRow(indexPath: IndexPath)
}

protocol PromoPresenterToView {
    func updatePromoSuccess()
}

protocol PromoPresenterToInteractor {
    var presenter: PromoInteractorToPresenter? { get set }
    func fetchPromo()
}

protocol PromoInteractorToPresenter {
    func fetchPromoSuccess(promo: [PromoModel])
}
