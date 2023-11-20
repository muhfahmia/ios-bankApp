//
//  TransactionInjection.swift
//  ios-bankApp
//
//  Created by Muhammad Fahmi on 14/11/23.
//

import UIKit
import RealmSwift
import Domain
import Data

protocol TransactionInjection {
    func resolve(payload: String) -> TransactionViewController
    func resolve() -> TransactionPresenter
    func resolve() -> TransactionRouter
    func resolve() -> TransactionInteractor
    func resolve() -> TransactionRepository
    func resolve() -> TransactionDataSource
    func resolve() -> TransactionUseCase
}

extension TransactionInjection where Self: Injection {
    
    func resolve(payload: String) -> TransactionViewController {
        let vc = TransactionViewController(payload: payload)
        let presenter: TransactionPresenter = self.resolve()
        let interactor: TransactionInteractor = self.resolve()
        vc.presenter = presenter
        vc.presenter?.view = vc
        vc.presenter?.interactor = interactor
        vc.presenter?.interactor?.presenter = presenter
        return vc
    }
    
    func resolve() -> TransactionRouter {
        return DefaultTransactionRouter(injection: self)
    }
    
    func resolve() -> TransactionPresenter {
        return TransactionPresenter()
    }
    
    func resolve() -> TransactionInteractor {
        return TransactionInteractor(transUseCase: resolve())
    }
    
    func resolve() -> TransactionUseCase {
        return TransactionCaseInteractor(transRepo: resolve())
    }
    
    func resolve() -> TransactionRepository {
        return DefaultTransactionRepository(transDataSource: resolve())
    }
    
    func resolve() -> TransactionDataSource {
        let realm = try? Realm()
        return DefaultTransactionDataSource(realm: realm)
    }
    
}
