//
//  MainTabBarController.swift
//  WeatherApp
//
//  Created by Hellizar on 16.03.21.
//

import UIKit
import CoreLocation

class MainTabBar: UITabBarController, CLLocationManagerDelegate {

    let locationManager = CLLocationManager()
    var currentLocation: CLLocation?
    var todayPresenter: TodayPresenter?
    var forecastPresenter: ForecastPresenter?

    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupVCs()
        setupLocation()
    }

    //MARK: - Location
    func setupLocation() {
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if !locations.isEmpty {
            currentLocation = locations.first
            requestWeatherForLocation()
        }
    }

    func requestWeatherForLocation() {
        guard let lat = currentLocation?.coordinate.latitude,
              let long = currentLocation?.coordinate.longitude else {
            return
        }

        NetworkManager.shared.request(lat: lat, long: long,
                                      successHandler: { [weak self] (model: Welcome) in
                                        
                                        guard let self = self else { return }
                                        self.todayPresenter?.view.configureView(with: model)
                                        self.todayPresenter?.view.sendData(with: model)
                                        self.forecastPresenter?.view.configureView(with: model)
                                      },
                                      errorHandler: { (error: NetworkError) in
                                        fatalError(error.localizedDescription)
                                      })
    }

    //MARK: - Methods
    func setupVCs() {
        let todayResult = ModuleBuilder.createTodayModule()
        let todayVC = todayResult.0
        todayPresenter = todayResult.1
        todayVC.tabBarItem = UITabBarItem(title: "Today",
                                          image: UIImage(systemName: "sun.max"),
                                          selectedImage: UIImage(systemName: "sun.max.fill"))
        let forecastResult = ModuleBuilder.createForecastModule()
        let forecastVC = forecastResult.0
        forecastPresenter = forecastResult.1
        forecastVC.tabBarItem = UITabBarItem(title: "Forecast",
                                             image: UIImage(systemName: "cloud.moon.bolt"),
                                             selectedImage: UIImage(systemName: "cloud.moon.bolt.fill"))

        viewControllers = [todayVC, forecastVC]
    }
}
