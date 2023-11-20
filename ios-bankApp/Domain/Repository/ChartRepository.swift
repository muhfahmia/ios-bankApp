//
//  ChartRepository.swift
//  ios-bankApp
//
//  Created by Muhammad Fahmi on 20/11/23.
//

import Foundation
import Combine

protocol ChartRepository {
    func getDataChart() -> Future<[ChartEntity], Never>
}
