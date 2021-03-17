//
//  NetworkError.swift
//  WeatherApp
//
//  Created by Hellizar on 16.03.21.
//

import Foundation

enum NetworkError {
    case incorrectUrl
    case networkError(error: Error)
    case serverError(statusCode: Int)
    case parsingError(error: Error)
    case unknown
}
