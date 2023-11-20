//
//  ChartProtocol.swift
//  ios-bankApp
//
//  Created by Muhammad Fahmi on 20/11/23.
//

import Foundation
import UIKit

protocol ChartViewToPresenter {
    var view: ChartPresenterToView? { get set }
    var interactor: ChartPresenterToInteractor? { get set }
    var router: ChartRouter? { get set }
    func viewDidLoad()
    func chartCell(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell
    func infoCell(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell
}

protocol ChartPresenterToView {
    func onFetchSuccess()
    func onFetchFailed()
}

protocol ChartPresenterToInteractor {
    var presenter: ChartInteractorToPresenter? { get set }
    func getDataChart()
}

protocol ChartInteractorToPresenter {
    func fetchChartSuccess(with chart: [ChartEntity])
    func fetchChartFailed()
}

