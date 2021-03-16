//
//  TodayViewController.swift
//  WeatherApp
//
//  Created by Hellizar on 16.03.21.
//

import UIKit

class TodayViewController: UIViewController {

    var presenter: TodayViewPresenterProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .secondarySystemBackground

    }
}

extension TodayViewController: TodayViewProtocol {

}
