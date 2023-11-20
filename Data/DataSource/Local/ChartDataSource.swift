//
//  ChartDataSource.swift
//  ios-bankApp
//
//  Created by Muhammad Fahmi on 19/11/23.
//

import Foundation
import Combine
import Domain

public protocol ChartDataSource {
    func getChartData() -> Future<[ChartEntity], Never>
}

public struct DefaultChartDataSource: ChartDataSource {
    
    public init() {}
    
    public func getChartData() -> Future<[ChartEntity], Never> {
        return Future<[ChartEntity], Never> { promise in
            promise(.success(ChartModel.chartDataModel))
        }
    }
}
