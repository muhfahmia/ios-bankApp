//
//  PromoPresenter.swift
//  ios-bankApp
//
//  Created by Muhammad Fahmi on 15/11/23.
//

import Foundation
import UIKit
import Domain

class PromoPresenter: PromoViewToPresenter {
    
    var view: PromoPresenterToView?
    var interactor: PromoPresenterToInteractor?
    var router: PromoRouter?
    var promoEntity: [PromoEntity]?
    func viewDidLoad() {
        interactor?.fetchPromo()
    }
    
    func promoCell(tableView: UITableView, indexPath: IndexPath) -> PromoTableViewCell {
        let cell: PromoTableViewCell = tableView.dequeueReusableCell(withClass: PromoTableViewCell.self)
        let promo = promoEntity?[indexPath.item]
        cell.promoImage.image = UIImage(named: promo?.image ?? "promo-1-bni")
        cell.promoTitle.text = promo?.title
        cell.promoCategory.text = promo?.category
        return cell
    }
    
    func didSelectRow(indexPath: IndexPath) {
        let promo = promoEntity?[indexPath.item]
        router?.routeToPromoDetail(from: self.view as! UIViewController, promoID: promo?.promoID ?? "")
    }
    
}

extension PromoPresenter: PromoInteractorToPresenter {
    func fetchPromoSuccess(promo: [PromoEntity]) {
        promoEntity = promo
        view?.updatePromoSuccess()
    }
}
