//
//  TodayPresenter.swift
//  WeatherApp
//
//  Created by Hellizar on 16.03.21.
//

import Foundation

protocol TodayViewProtocol: class {
    func configureView(with model: Welcome)
    func sendData(with model: Welcome)
}

protocol TodayViewPresenterProtocol: class {
    init(view: TodayViewProtocol)
}

class TodayPresenter: TodayViewPresenterProtocol {

    var view: TodayViewProtocol

    required init(view: TodayViewProtocol) {
        self.view = view
    }
}
