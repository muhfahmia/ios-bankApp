//
//  BankAccountContract.swift
//  ios-bankApp
//
//  Created by Muhammad Fahmi on 13/11/23.
//

import UIKit
import Domain

protocol BankAccountViewToPresenter {
    var view: BankAccountPresenterToView? { get set}
    var interactor: BankAccountPresenterToInteractor? { get set }
    var router: BankAccountRouter? { get set }
    var transaction: [TransactionEntity]? { get set }
    func balanceCell(tableView: UITableView, vc: UIViewController) -> UITableViewCell
    func titleCell(tableView: UITableView) -> UITableViewCell
    func historyCell(tableView: UITableView, indexPath: IndexPath, vc: UIViewController) -> UITableViewCell
    func messageCell(tableView: UITableView) -> UITableViewCell
    func viewDidLoad()
    func viewWillAppear()
}

protocol BankAccountPresenterToView {
    func onFetchSuccess()
    func onFetchSuccessTransactionList()
}

protocol BankAccountInteractorToPresenter {
    func fetchTransactionListSuccess(with trans: [TransactionEntity])
    func fetchBankAccountSuccess(with account: BankAccountEntity)
    func fetchBankAccountFailure(with error: String)
}

protocol BankAccountPresenterToInteractor {
    var presenter: BankAccountInteractorToPresenter? { get set }
    func getBankAccount()
    func getListTransaction()
}
