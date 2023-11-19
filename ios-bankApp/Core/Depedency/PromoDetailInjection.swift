//
//  PromoDetailInjection.swift
//  ios-bankApp
//
//  Created by Muhammad Fahmi on 15/11/23.
//

import UIKit

protocol PromoDetailInjection {
    func resolve() -> PromoDetailViewController
    func resolve() -> PromoDetailPresenter
    func resolve() -> PromoDetailInteractor
    func resolve() -> PromoDetailRouter
}

extension PromoDetailInjection where Self: Injection {
    
    func resolve() -> PromoDetailViewController {
        let vc: PromoDetailViewController = PromoDetailViewController()
        let presenter: PromoDetailPresenter = self.resolve()
        let interactor: PromoDetailInteractor = self.resolve()
        vc.presenter = presenter
        vc.presenter?.view = vc
        vc.presenter?.router = self.resolve()
        vc.presenter?.interactor = interactor
        vc.presenter?.interactor?.presenter = presenter
        return vc
    }
    
    func resolve() -> PromoDetailPresenter {
        return PromoDetailPresenter()
    }
    
    func resolve() -> PromoDetailInteractor {
        return PromoDetailInteractor(promoRepo: resolve())
    }
    
    func resolve() -> PromoDetailRouter {
        return DefaultPromoDetailRouter(injection: self)
    }
    
}
