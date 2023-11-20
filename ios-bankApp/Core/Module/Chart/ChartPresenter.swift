//
//  ChartPresenter.swift
//  ios-bankApp
//
//  Created by Muhammad Fahmi on 20/11/23.
//

import Foundation
import UIKit

class ChartPresenter: ChartViewToPresenter {
    var view: ChartPresenterToView?
    
    var interactor: ChartPresenterToInteractor?
    
    var router: ChartRouter?
    
    var chartData: [ChartEntity]?
    
    func viewDidLoad() {
        interactor?.getDataChart()
    }
    
    func chartCell(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        let cell: ChartTableViewCell = tableView.dequeueReusableCell(withClass: ChartTableViewCell.self)
        return cell
    }
    
    func infoCell(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        let cell: InfoSectionTableViewCell = tableView.dequeueReusableCell(withClass: InfoSectionTableViewCell.self)
        return cell
    }
    
}

extension ChartPresenter: ChartInteractorToPresenter {
    func fetchChartSuccess(with chart: [ChartEntity]) {
        chartData = chart
        view?.onFetchSuccess()
    }
    
    func fetchChartFailed() {
        view?.onFetchFailed()
    }
    
}
