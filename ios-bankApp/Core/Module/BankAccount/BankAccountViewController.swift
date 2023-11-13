//
//  HomeViewController.swift
//  ios-bankApp
//
//  Created by Muhammad Fahmi on 13/11/23.
//

import UIKit
import RealmSwift

class BankAccountViewController: UIViewController, BankAccountPresenterToView, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var tblView: UITableView!
    
    enum TableSection: Int, CaseIterable {
        case balanceCell
    }
    
    var presenter: BankAccountViewToPresenter?
    var bankAccount: BankAccount?
    
    init() {
        super.init(nibName: String(describing: BankAccountViewController.self), bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        presenter?.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    private func setupUI() {
        tblView.dataSource = self
        tblView.delegate = self
        
        tblView.register(nibWithCellClass: BalanceTableViewCell.self)
    }
    
    func onFetchSuccess(with account: BankAccount) {
        bankAccount = account
        tblView.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        TableSection.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = TableSection(rawValue: indexPath.section)
        switch section {
        case .balanceCell:
            let cell: BalanceTableViewCell = tableView.dequeueReusableCell(withClass: BalanceTableViewCell.self)
            let balance = String().rupiahFormat(from: bankAccount?.accountBalance ?? 0)
            cell.accountBalance.text = balance
            cell.doPaymentClick = { [weak self] in
                let vc = PaymentViewController()
                self?.navigationController?.pushViewController(vc, animated: true)
            }
            return cell
        case .none:
            return UITableViewCell()
        }
    }
    
}
