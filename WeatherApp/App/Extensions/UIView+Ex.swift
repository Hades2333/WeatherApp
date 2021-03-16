//
//  UIView+Ex.swift
//  WeatherApp
//
//  Created by Hellizar on 16.03.21.
//

import UIKit

extension UIView {
    func addSubviews(_ views: [UIView]) {
        for view in views {
            self.addSubview(view)
        }
    }
}
