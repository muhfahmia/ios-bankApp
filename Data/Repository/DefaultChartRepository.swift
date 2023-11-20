//
//  DefaultChartRepository.swift
//  ios-bankApp
//
//  Created by Muhammad Fahmi on 20/11/23.
//

import Foundation
import Combine
import Domain

public class DefaultChartRepository: ChartRepository {
    
    let chartDataSource: ChartDataSource
    
    public init(chartDataSource: ChartDataSource) {
        self.chartDataSource = chartDataSource
    }
    
    public func getDataChart() -> Future<[ChartEntity], Never> {
        chartDataSource.getChartData()
    }
    
}
