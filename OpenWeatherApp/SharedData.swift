//
//  SharedData.swift
//  OpenWeatherApp
//
//  Created by Dennis Kwok on 13/5/19.
//  Copyright © 2019 Dennis. All rights reserved.
//

import Foundation

class SharedData{
    
    static let sharedData = SharedData()
    
    static let openWeatherMapURL = "https://api.openweathermap.org/data/2.5/forecast"
    static let openWeatherMapAPIKey = "33c5a42368eb6b8a237785214668e662"
    
    init(){}
    
    func kelvinToCelcius(temp:Float)->String{
        return String(format: "%.1f", temp - 273.15)
    }
}
