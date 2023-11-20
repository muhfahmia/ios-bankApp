//
//  PromoInjection.swift
//  ios-bankApp
//
//  Created by Muhammad Fahmi on 15/11/23.
//

import Domain
import Data

protocol PromoInjection {
    func resolve() -> PromoViewController
    func resolve() -> PromoPresenter
    func resolve() -> PromoInteractor
    func resolve() -> PromoRouter
    func resolve() -> PromoUseCase
    func resolve() -> PromoRepository
    func resolve() -> PromoDataSource
}

extension PromoInjection where Self: Injection {
    
    func resolve() -> PromoViewController {
        let vc: PromoViewController = PromoViewController()
        let presenter: PromoPresenter = self.resolve()
        let interactor: PromoInteractor = self.resolve()
        vc.presenter = presenter
        vc.presenter?.view = vc
        vc.presenter?.interactor = interactor
        vc.presenter?.router = self.resolve()
        vc.presenter?.interactor?.presenter = presenter
        return vc
    }
    
    func resolve() -> PromoPresenter {
        return PromoPresenter()
    }
    
    func resolve() -> PromoInteractor {
        return PromoInteractor(promoUseCase: resolve())
    }
    
    func resolve() -> PromoRouter {
        return DefaultPromoRouter(injection: self)
    }
    
    func resolve() -> PromoUseCase {
        return PromoInteractorCase(promoRepo: resolve())
    }
    
    func resolve() -> PromoRepository {
        return DefaultPromoRepository(promoSource: resolve())
    }
    
    func resolve() -> PromoDataSource {
        return DefaultPromoDataSource()
    }
}
