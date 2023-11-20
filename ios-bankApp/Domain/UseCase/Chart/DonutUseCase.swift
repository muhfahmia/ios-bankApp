//
//  ChartUseCase.swift
//  ios-bankApp
//
//  Created by Muhammad Fahmi on 20/11/23.
//

import Foundation
import Combine

protocol DonutUseCase {
    func list() -> Future<[ChartEntity], Never>
}

class DonutInteractor: DonutUseCase {
    
    private let chartRepo: ChartRepository
    
    init(chartRepo: ChartRepository) {
        self.chartRepo = chartRepo
    }
    
    func list() -> Future<[ChartEntity], Never> {
        chartRepo.getDataChart()
    }
    
}
