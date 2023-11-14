//
//  BankAccountContract.swift
//  ios-bankApp
//
//  Created by Muhammad Fahmi on 13/11/23.
//

import UIKit

protocol BankAccountViewToPresenter {
    var view: BankAccountPresenterToView? { get set}
    var interactor: BankAccountPresenterToInteractor? { get set }
    var router: BankAccountRouter? { get set }
    func balanceCell(tableView: UITableView, vc: UIViewController) -> UITableViewCell
    func viewDidLoad()
}

protocol BankAccountPresenterToView {
    func onFetchSuccess()
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
