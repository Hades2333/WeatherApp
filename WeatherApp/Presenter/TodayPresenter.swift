//
//  TodayPresenter.swift
//  WeatherApp
//
//  Created by Hellizar on 16.03.21.
//

import Foundation

protocol TodayViewProtocol: class {

}

protocol TodayViewPresenterProtocol: class {
    init(view: TodayViewProtocol, model: WeatherModel)

}

class TodayPresenter: TodayViewPresenterProtocol {

    let view: TodayViewProtocol
    let model: WeatherModel

    required init(view: TodayViewProtocol, model: WeatherModel) {
        self.view = view
        self.model = model
    }
}
