//
//  ModuleBuilder.swift
//  WeatherApp
//
//  Created by Hellizar on 16.03.21.
//

import UIKit

protocol Builder {
    static func createTodayModule() -> UIViewController
    static func createForecastModule() -> UIViewController
}

class ModuleBuilder: Builder {

    static func createTodayModule() -> UIViewController {
        let view = TodayViewController()
        let presenter = TodayPresenter(view: view)
        view.presenter = presenter
        return view
    }

    static func createForecastModule() -> UIViewController {
        let view = ForecastViewController()
        let presenter = ForecastPresenter(view: view)
        view.presenter = presenter
        return view
    }
}
