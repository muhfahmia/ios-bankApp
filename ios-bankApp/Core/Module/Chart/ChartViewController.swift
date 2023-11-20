//
//  ChartViewController.swift
//  ios-bankApp
//
//  Created by Muhammad Fahmi on 18/11/23.
//
import Foundation
import Combine
import UIKit

class ChartViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, ChartPresenterToView {
    
    @IBOutlet weak var tblChart: UITableView!
    
    enum TableChartSection: Int, CaseIterable {
        case chartSection
        case infoSection
    }
    
    var presenter: ChartViewToPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Chart"
        navigationController?.navigationBar.prefersLargeTitles = true
        setupTbl()
        presenter?.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func setupTbl() {
        tblChart.delegate = self
        tblChart.dataSource = self
        tblChart.register(nibWithCellClass: ChartTableViewCell.self)
        tblChart.register(nibWithCellClass: InfoSectionTableViewCell.self)
    }
    
    func onFetchSuccess() {
        tblChart.reloadData()
        print("success view")
    }
    
    func onFetchFailed() {
        print("failed view")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        TableChartSection.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let section = TableChartSection(rawValue: section)
        switch section {
        case .chartSection:
            return 1
        case .infoSection:
            return presenter?.chartData?.count ?? 0
        case .none:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = TableChartSection(rawValue: indexPath.section)
        let cellDefault = UITableViewCell()
        switch section {
        case .chartSection:
            return presenter?.chartCell(tableView: tableView, indexPath: indexPath) ?? cellDefault
        case .infoSection:
            return presenter?.infoCell(tableView: tableView, indexPath: indexPath) ?? cellDefault
        case .none:
            return cellDefault
        }
    }

}
