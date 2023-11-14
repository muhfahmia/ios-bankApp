//
//  BankAccountInjection.swift
//  ios-bankApp
//
//  Created by Muhammad Fahmi on 13/11/23.
//
import UIKit
import RealmSwift

protocol BankAccountInjection {
    func resolve() -> BankAccountViewController
    func resolve() -> BankAccountPresenter
    func resolve() -> BankAccountInteractor
    func resolve() -> BankAccountRouter
    
    func resolve() -> BankAccountRepository
    func resolve() -> BankAccountDataSource
}

extension BankAccountInjection where Self: Injection {
    
    func resolve() -> BankAccountViewController {
        let vc: BankAccountViewController = BankAccountViewController()
        let interactor: BankAccountInteractor = self.resolve()
        let presenter: BankAccountPresenter = self.resolve()
        vc.presenter = presenter
        vc.presenter?.view = vc
        vc.presenter?.interactor = interactor
        vc.presenter?.interactor?.presenter = presenter
        vc.presenter?.router = self.resolve()
        return vc
    }
    
    func resolve() -> BankAccountPresenter {
        return BankAccountPresenter()
    }
    
    func resolve() -> BankAccountInteractor {
        return BankAccountInteractor(repository: resolve())
    }
    
    func resolve() -> BankAccountRouter {
        return DefaultBankAccountRouter(injection: self)
    }
    
    func resolve() -> BankAccountRepository {
        return DefaultBankAccount(bankAccountSource: resolve())
    }
    
    func resolve() -> BankAccountDataSource {
        let realm = try? Realm()
        return DefaultBankAccountDataSource(realm: realm)
    }
}
