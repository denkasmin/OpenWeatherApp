//
//  Weather.swift
//  OpenWeatherApp
//
//  Created by Dennis Kwok on 13/5/19.
//  Copyright © 2019 Dennis. All rights reserved.
//

import Foundation

//Weather object
struct WeatherForecast:Codable{
    let city:City
    let cnt:Int
    let cod:String
    let list:[Forecast]
}

struct Forecast:Codable{
    var clouds:Cloud
    var dt:Int
    var dt_txt:String
    var main:MainForecastData
    var sys:Sys
    var weather:[WeatherDesc]
    var wind:Wind
}

struct Cloud:Codable{
    var all:Int
}

struct MainForecastData:Codable{
    var grnd_level:Float
    var humidity:Int
    var pressure:Float
    var sea_level:Float
    var temp:Float
    var temp_kf:Float
    var temp_max:Float
    var temp_min:Float
}

struct Sys:Codable{
    var pod:String
}

struct WeatherDesc:Codable{
    var description:String
    var icon:String
    var id:Int
    var main:String
}

struct Wind:Codable{
    var deg:Float
    var speed:Float
}

struct City:Codable{
    var coord:Coordinate
    var country:String
    var id:Int
    var name:String
    var population:Int
}

struct Coordinate:Codable {
    var lat:Float
    var lon:Float
}

