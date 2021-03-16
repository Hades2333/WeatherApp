//
//  UIStackView+Ex.swift
//  WeatherApp
//
//  Created by Hellizar on 16.03.21.
//

import UIKit

extension UIStackView {
    func addArrangedSubviews(_ views: [UIView]) {
        for view in views {
            self.addArrangedSubview(view)
        }
    }
}
