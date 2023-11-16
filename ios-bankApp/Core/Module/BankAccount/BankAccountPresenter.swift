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
    var transaction: [TransactionEntity]?
    
    func viewDidLoad() {
        interactor?.getBankAccount()
        interactor?.getListTransaction()
    }
    
    func viewWillAppear() {
        viewDidLoad()
    }
    
    func balanceCell(tableView: UITableView, vc: UIViewController) -> UITableViewCell {
        let cell: BalanceTableViewCell = tableView.dequeueReusableCell(withClass: BalanceTableViewCell.self)
        let balance = String().rupiahFormat(from: bankAccount?.accountBalance ?? 0)
        cell.accountBalance.text = balance
        cell.doPaymentClick = { [weak self] in
            self?.router?.routeToPayment(from: vc)
        }
        return cell
    }
    
    func titleCell(tableView: UITableView) -> UITableViewCell {
        let cell: TitleTableViewCell = tableView.dequeueReusableCell(withClass: TitleTableViewCell.self)
        return cell
    }
    
    func historyCell(tableView: UITableView, indexPath: IndexPath ,vc: UIViewController) -> UITableViewCell {
        let cell: HistoryCellTableViewCell = tableView.dequeueReusableCell(withClass: HistoryCellTableViewCell.self)
        let trans = transaction?[indexPath.item]
        
        if trans?.type == "IN" {
            cell.transImage.image = UIImage(systemName: "arrowshape.up.fill")
            cell.transImage.tintColor = UIColor.primaryColor
        }
        cell.transID.text = trans?.transID
        cell.merchant.text = trans?.merchant
        cell.amount.text = String().rupiahFormat(from: trans?.amount ?? 0)
        cell.paymentDate.text = trans?.paymentDate
        return cell
    }
    
    func messageCell(tableView: UITableView) -> UITableViewCell {
        let cell: MessageTableViewCell = tableView.dequeueReusableCell(withClass: MessageTableViewCell.self)
        return cell
    }
    
}

extension BankAccountPresenter: BankAccountInteractorToPresenter {
    
    func fetchTransactionListSuccess(with trans: [TransactionModel]) {
        transaction = trans
        view?.onFetchSuccessTransactionList()
        
    }
    
    func fetchBankAccountSuccess(with account: BankAccount) {
        bankAccount = account
        view?.onFetchSuccess()
    }
    
    func fetchBankAccountFailure(with error: String) {
        print("error from presenter \(error)")
    }
}
