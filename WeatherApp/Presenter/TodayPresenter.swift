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
    init(view: TodayViewProtocol)

}

class TodayPresenter: TodayViewPresenterProtocol {

    let view: TodayViewProtocol

    required init(view: TodayViewProtocol) {
        self.view = view
    }
}
