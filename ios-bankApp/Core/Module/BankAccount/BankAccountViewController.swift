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
        case titleCell
        case historyCell
        case messageCell
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
        presenter?.viewWillAppear()
    }
    
    private func setupUI() {
        tblView.dataSource = self
        tblView.delegate = self
        tblView.register(nibWithCellClass: BalanceTableViewCell.self)
        tblView.register(nibWithCellClass: TitleTableViewCell.self)
        tblView.register(nibWithCellClass: HistoryCellTableViewCell.self)
        tblView.register(nibWithCellClass: MessageTableViewCell.self)
    }
    
    func onFetchSuccess() {
        tblView.reloadSections(IndexSet(integer: 0), with: .automatic)
    }
    
    func onFetchSuccessTransactionList() {
        tblView.reloadSections(IndexSet(integer: 2), with: .automatic)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        TableSection.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let section = TableSection(rawValue: section)
        switch section {
        case .balanceCell:
            return 1
        case .titleCell:
            return 1
        case .historyCell:
            return presenter?.transaction?.count ?? 0
        case .messageCell:
            return 0
        case .none:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = TableSection(rawValue: indexPath.section)
        switch section {
        case .balanceCell:
            return presenter?.balanceCell(tableView: tableView, vc: self) ?? UITableViewCell()
        case .titleCell:
            return presenter?.titleCell(tableView: tableView) ?? UITableViewCell()
        case .historyCell:
            return presenter?.historyCell(tableView: tableView, indexPath: indexPath, vc: self) ?? UITableViewCell()
        case .messageCell:
            return presenter?.messageCell(tableView: tableView) ?? UITableViewCell()
        case .none:
            return UITableViewCell()
        }
    }
    
}
