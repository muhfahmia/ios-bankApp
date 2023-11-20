//
//  ChartInteractor.swift
//  ios-bankApp
//
//  Created by Muhammad Fahmi on 20/11/23.
//

import Foundation
import Combine

class ChartInteractor: ChartPresenterToInteractor {
    private let donutUseCase: DonutUseCase
    var presenter: ChartInteractorToPresenter?
    var store = Set<AnyCancellable>()

    init(donutUseCase: DonutUseCase) {
        self.donutUseCase = donutUseCase
    }
    
    func getDataChart() {
        donutUseCase.list()
        .receive(on: RunLoop.main)
        .sink(receiveCompletion: { [weak self] completion in
            switch completion {
            case .finished:
                self?.presenter?.fetchChartSuccess()
            }
        },receiveValue: { [weak self] value in
            self?.presenter?.chartData = value
        }).store(in: &store)
    }
}
