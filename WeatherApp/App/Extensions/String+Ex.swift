//
//  String+Ex.swift
//  WeatherApp
//
//  Created by Hellizar on 17.03.21.
//

import Foundation

//extension String {
//    func convert() -> String {
//        let formatter = DateFormatter()
//        formatter.dateFormat = "HH:mm"
//        let myDate = Date(from: self)
//
//print(self)
//        print("\(formatter.date(from: self))")
//
//        return "\(formatter.date(from: self) ?? Date())"
//    }
//}

extension String {
    static func convert(date: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"//this your string date format
        dateFormatter.timeZone = NSTimeZone(name: "UTC") as TimeZone?
        dateFormatter.locale = Locale(identifier: "your_loc_id")
        let convertedDate = dateFormatter.date(from: date)
        
        guard dateFormatter.date(from: date) != nil else {
            assert(false, "no date from string")
            return ""
        }
        
        dateFormatter.dateFormat = "HH:mm"///this is what you want to convert format
        dateFormatter.timeZone = NSTimeZone(name: "UTC") as TimeZone?
        let timeStamp = dateFormatter.string(from: convertedDate!)
        
        return timeStamp
    }
}
