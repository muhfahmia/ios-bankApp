//
//  DefaultChartRepository.swift
//  ios-bankApp
//
//  Created by Muhammad Fahmi on 20/11/23.
//

import Foundation
import Combine

class DefaultChartRepository: ChartRepository {
    
    let chartDataSource: ChartDataSource
    
    init(chartDataSource: ChartDataSource) {
        self.chartDataSource = chartDataSource
    }
    
    func getDataChart() -> Future<[ChartEntity], Never> {
        chartDataSource.getChartData()
    }
    
}
