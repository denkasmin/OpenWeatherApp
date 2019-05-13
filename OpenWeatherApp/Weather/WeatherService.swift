//
//  WeatherService.swift
//  OpenWeatherApp
//
//  Created by Dennis Kwok on 13/5/19.
//  Copyright © 2019 Dennis. All rights reserved.
//

import Foundation
import CoreData

class WeatherService{
    
    
    func getWeather(city: String, completion: @escaping (WeatherForecast) -> ()) {
        let session = URLSession.shared
        let URLRequest = URL(string: "\(SharedData.openWeatherMapURL)?APPID=\(SharedData.openWeatherMapAPIKey)&q=\(city)")
        
        let datatask = session.dataTask(with: URLRequest!, completionHandler: { data, response, error in
            
            guard let httpResponse = response as? HTTPURLResponse,(200...299).contains(httpResponse.statusCode) else {
                    print("HTTP Url Response error")
                    return
            }
            guard let mime = response!.mimeType, mime == "application/json" else {
                print("Wrong response type!")
                return
            }
            
            let weather = try! JSONDecoder().decode(WeatherForecast.self, from: data!)
            
            
            completion(weather)
        })
        
        datatask.resume()
        
    }
}
