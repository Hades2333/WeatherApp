//
//  LocationManager.swift
//  WeatherApp
//
//  Created by Hellizar on 16.03.21.
//

import Foundation
import CoreLocation

class MyLocation: NSObject, CLLocationManagerDelegate {

    static let shared = MyLocation()

    let locationManager : CLLocationManager

    override init() {
        locationManager = CLLocationManager()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        super.init()
        locationManager.delegate = self
    }

    func start() {
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let myLocation = locations.last else {
            print("location error")
            return
        }
        print("Моё местонахождение \(myLocation)")
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Произошла ошибка \(error)")
        locationManager.stopUpdatingLocation()
    }
}
