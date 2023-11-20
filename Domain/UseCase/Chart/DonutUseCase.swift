//
//  ChartUseCase.swift
//  ios-bankApp
//
//  Created by Muhammad Fahmi on 20/11/23.
//

import Foundation
import Combine

public protocol DonutUseCase {
    func list() -> Future<[ChartEntity], Never>
}

public class DonutInteractor: DonutUseCase {
    
    private let chartRepo: ChartRepository
    
    public init(chartRepo: ChartRepository) {
        self.chartRepo = chartRepo
    }
    
    public func list() -> Future<[ChartEntity], Never> {
        chartRepo.getDataChart()
    }
    
}
