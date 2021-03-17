//
//  TodayPresenter.swift
//  WeatherApp
//
//  Created by Hellizar on 16.03.21.
//

import Foundation

protocol TodayViewProtocol: class {
    func configureView(with model: Welcome)
}

protocol TodayViewPresenterProtocol: class {
    init(view: TodayViewProtocol)
}

protocol GetModelForTodayPresenterDelegate {
    func get(_ model: Welcome)
}

class TodayPresenter: TodayViewPresenterProtocol {

    //var parsedModel: Welcome?
    var view: TodayViewProtocol

    required init(view: TodayViewProtocol) {
        self.view = view
    }
}

extension TodayPresenter: GetModelForTodayPresenterDelegate {
    func get(_ model: Welcome) {
        view.configureView(with: model)
    }
}
