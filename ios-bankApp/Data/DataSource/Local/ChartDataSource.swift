//
//  ChartDataSource.swift
//  ios-bankApp
//
//  Created by Muhammad Fahmi on 19/11/23.
//

import Foundation
import Combine

protocol ChartDataSource {
    func getChartData() -> Future<[ChartEntity], Never>
}

struct DefaultChartDataSource: ChartDataSource {
    
    func getChartData() -> Future<[ChartEntity], Never> {
        return Future<[ChartEntity], Never> { promise in
            promise(.success(ChartModel.chartDataModel))
        }
    }
}
