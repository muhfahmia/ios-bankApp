//
//  HomePresenter.swift
//  ios-bankApp
//
//  Created by Muhammad Fahmi on 13/11/23.
//

import UIKit

class BankAccountPresenter: BankAccountViewToPresenter {
    
    var view: BankAccountPresenterToView?
    var interactor: BankAccountPresenterToInteractor?
    var router: BankAccountRouter?
    
    var bankAccount: BankAccount?
    
    func balanceCell(tableView: UITableView, vc: UIViewController) -> UITableViewCell {
        let cell: BalanceTableViewCell = tableView.dequeueReusableCell(withClass: BalanceTableViewCell.self)
        let balance = String().rupiahFormat(from: bankAccount?.accountBalance ?? 0)
        cell.accountBalance.text = balance
        cell.doPaymentClick = { [weak self] in
            self?.router?.routeToPayment(from: vc)
        }
        return cell
    }
    
    func viewDidLoad() {
        interactor?.getBankAccount()
    }
    
}

extension BankAccountPresenter: BankAccountInteractorToPresenter {
    func fetchBankAccountSuccess(with account: BankAccount) {
        bankAccount = account
        view?.onFetchSuccess()
    }
    
    func fetchBankAccountFailure(with error: String) {
        print("error from presenter \(error)")
    }
}
