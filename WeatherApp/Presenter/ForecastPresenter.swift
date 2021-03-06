//
//  ForecastPresenter.swift
//  WeatherApp
//
//  Created by Hellizar on 16.03.21.
//

import Foundation

protocol ForecastViewProtocol: class {
    func configureView(with model: Welcome)
}

protocol ForecastViewPresenterProtocol: class {
    init(view: ForecastViewProtocol)
}

class ForecastPresenter: ForecastViewPresenterProtocol {

    let view: ForecastViewProtocol

    required init(view: ForecastViewProtocol) {
        self.view = view
    }
}
