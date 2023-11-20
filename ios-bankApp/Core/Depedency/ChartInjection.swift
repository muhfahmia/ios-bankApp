//
//  ChartInjection.swift
//  ios-bankApp
//
//  Created by Muhammad Fahmi on 19/11/23.
//

import UIKit

protocol ChartInjection {
    func resolve() -> ChartViewController
    func resolve() -> ChartPresenter
    func resolve() -> ChartRouter
    func resolve() -> ChartInteractor
    func resolve() -> ChartRepository
    func resolve() -> ChartDataSource
    func resolve() -> DonutUseCase
}

extension ChartInjection where Self: Injection {
    func resolve() -> ChartViewController {
        let vc: ChartViewController = ChartViewController()
        let presenter: ChartPresenter = self.resolve()
        let interactor: ChartInteractor = self.resolve()
        vc.presenter = presenter
        vc.presenter?.view = vc
        vc.presenter?.router = self.resolve()
        vc.presenter?.interactor = interactor
        vc.presenter?.interactor?.presenter = presenter
        return vc
    }
    
    func resolve() -> ChartPresenter {
        return ChartPresenter()
    }
    
    func resolve() -> ChartRouter {
        return DefaultChartRouter(injection: self)
    }
    
    func resolve() -> ChartInteractor {
        return ChartInteractor(donutUseCase: resolve())
    }
    
    func resolve() -> ChartRepository {
        return DefaultChartRepository(chartDataSource: resolve())
    }
    
    func resolve() -> ChartDataSource {
        return DefaultChartDataSource()
    }
    
    func resolve() -> DonutUseCase {
        return DonutInteractor(chartRepo: resolve())
    }
}
