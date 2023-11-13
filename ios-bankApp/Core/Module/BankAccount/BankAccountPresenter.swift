//
//  HomePresenter.swift
//  ios-bankApp
//
//  Created by Muhammad Fahmi on 13/11/23.
//

import Foundation

class BankAccountPresenter: BankAccountViewToPresenter {
    
    var view: BankAccountPresenterToView?
    var interactor: BankAccountPresenterToInteractor?
    var router: BankAccountRouter?
    
    func viewDidLoad() {
        interactor?.getBankAccount()
    }
    
    func didSelectRowAt() {
        
    }
    
}

extension BankAccountPresenter: BankAccountInteractorToPresenter {
    func fetchBankAccountSuccess(with account: BankAccount) {
        view?.onFetchSuccess(with: account)
    }
    
    func fetchBankAccountFailure(with error: String) {
        print("error from presenter \(error)")
    }
    
    
}
