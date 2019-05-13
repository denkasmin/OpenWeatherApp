//
//  WeatherForecastTableViewController.swift
//  OpenWeatherApp
//
//  Created by Dennis Kwok on 13/5/19.
//  Copyright © 2019 Dennis. All rights reserved.
//

import Foundation
import UIKit

class WeatherForecastTableViewController: NSObject, UITableViewDelegate, UITableViewDataSource {
    public var dailyForecast:[Forecast] = []
    
    
    //MARK: Table View Delegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dailyForecast.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherForecastCell", for: indexPath) as! WeatherForecastCell
        
        let forecast = dailyForecast[indexPath.row]
        
        cell.dateTimeLabel.text = forecast.dt_txt
        cell.tempLabel.text = "\("\(SharedData.sharedData.kelvinToCelcius(temp: forecast.main.temp))°")"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return nil
    }
}
