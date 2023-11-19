//
//  PromoViewController.swift
//  ios-bankApp
//
//  Created by Muhammad Fahmi on 15/11/23.
//

import UIKit

class PromoViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, PromoPresenterToView {
    
    @IBOutlet weak var tblPromo: UITableView!
    
    var presenter: PromoViewToPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Promo"
        self.setLargeTitleDisplayMode(.automatic)
        setupUI()
        presenter?.viewDidLoad()
    }
    
    private func setupUI() {
        tblPromo.delegate = self
        tblPromo.dataSource = self
        tblPromo.register(nibWithCellClass: PromoTableViewCell.self)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter?.promoEntity?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return presenter?.promoCell(tableView: tableView, indexPath: indexPath) ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.didSelectRow(indexPath: indexPath)
    }
    
    func updatePromoSuccess() {
        print("update success")
        tblPromo.reloadData()
    }
}
