//
//  BankAccountContract.swift
//  ios-bankApp
//
//  Created by Muhammad Fahmi on 13/11/23.
//

import Foundation

protocol BankAccountViewToPresenter {
    var view: BankAccountPresenterToView? { get set}
    var interactor: BankAccountPresenterToInteractor? { get set }
    var router: BankAccountRouter? { get set }
    func viewDidLoad()
    func didSelectRowAt()
}

protocol BankAccountPresenterToView {
    func onFetchSuccess(with account: BankAccount)
}

protocol BankAccountInteractorToPresenter {
    func fetchBankAccountSuccess(with account: BankAccount)
    func fetchBankAccountFailure(with error: String)
}

protocol BankAccountPresenterToInteractor {
    var presenter: BankAccountInteractorToPresenter? { get set }
    func getBankAccount()
    func addBankAccount()
}
