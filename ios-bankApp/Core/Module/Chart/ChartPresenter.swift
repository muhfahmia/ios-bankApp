//
//  ChartPresenter.swift
//  ios-bankApp
//
//  Created by Muhammad Fahmi on 20/11/23.
//

import Foundation
import UIKit
import Combine

class ChartPresenter: ChartViewToPresenter {
    var view: ChartPresenterToView?
    var interactor: ChartPresenterToInteractor?
    var router: ChartRouter?
    
    var chartData: [ChartEntity]?
    var store = Set<AnyCancellable>()
    
    func viewDidLoad() {
        interactor?.getDataChart()
    }
    
    func chartCell(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        let cell: ChartTableViewCell = tableView.dequeueReusableCell(withClass: ChartTableViewCell.self)
        cell.setupData(chartData: chartData ?? [])
        return cell
    }
    
    func infoCell(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        let cell: InfoSectionTableViewCell = tableView.dequeueReusableCell(withClass: InfoSectionTableViewCell.self)
        let chart = chartData?[indexPath.item]
        cell.infoImage.tintColor = chart?.color
        cell.infoTitle.text = chart?.label
        if let percentage = chart?.percentage {
            cell.infoPercentage.text = String(describing: "\(percentage)%")
        }
        return cell
    }
    
}

extension ChartPresenter: ChartInteractorToPresenter {
    
    func fetchChartSuccess() {
        view?.onFetchSuccess()
    }
    
    func fetchChartFailed() {
        view?.onFetchFailed()
    }
    
}
