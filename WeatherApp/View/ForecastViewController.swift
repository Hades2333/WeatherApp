//
//  ForecastViewController.swift
//  WeatherApp
//
//  Created by Hellizar on 16.03.21.
//

import UIKit

import UIKit

class ForecastViewController: UIViewController {

    var presenter: ForecastViewPresenterProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .secondarySystemBackground

    }

}

extension ForecastViewController: ForecastViewProtocol {

}

