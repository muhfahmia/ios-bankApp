//
//  HomeViewController.swift
//  ios-bankApp
//
//  Created by Muhammad Fahmi on 13/11/23.
//

import UIKit
import RealmSwift

protocol BankAccountOutput {
    
}

class BankAccountViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tblView: UITableView!
    
    enum TableSection: Int, CaseIterable {
        case balanceCell
    }
    
    init() {
        super.init(nibName: String(describing: BankAccountViewController.self), bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
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
    
    func numberOfSections(in tableView: UITableView) -> Int {
        TableSection.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: BalanceTableViewCell = tableView.dequeueReusableCell(withClass: BalanceTableViewCell.self)
        return cell
    }
    
}
