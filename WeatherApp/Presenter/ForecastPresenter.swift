//
//  ForecastPresenter.swift
//  WeatherApp
//
//  Created by Hellizar on 16.03.21.
//

import Foundation

protocol ForecastViewProtocol: class {
}

protocol ForecastViewPresenterProtocol: class {
    init(view: ForecastViewProtocol, model: WeatherModel)
}

class ForecastPresenter: ForecastViewPresenterProtocol {

    let view: ForecastViewProtocol
    let model: WeatherModel

    required init(view: ForecastViewProtocol, model: WeatherModel) {
        self.view = view
        self.model = model
    }
}
