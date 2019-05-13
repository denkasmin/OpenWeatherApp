//
//  ViewController.swift
//  OpenWeatherApp
//
//  Created by Dennis Kwok on 13/5/19.
//  Copyright © 2019 Dennis. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var weatherDescLabel: UILabel!
    @IBOutlet weak var weatherDailyTableView: UITableView!
    
    let weatherService:WeatherService = WeatherService()
    let weatherTableVC:WeatherForecastTableViewController = WeatherForecastTableViewController()
    
    private let refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.weatherDailyTableView.register(UINib(nibName: "WeatherForecastCell", bundle: nil), forCellReuseIdentifier:  "WeatherForecastCell")
        self.weatherDailyTableView.delegate = weatherTableVC
        self.weatherDailyTableView.dataSource = weatherTableVC
        self.weatherDailyTableView.refreshControl = refreshControl
        self.refreshControl.addTarget(self, action: #selector(getWeatherData), for: .valueChanged)
        
        self.getWeatherData()
    }
    
    
    @objc private func getWeatherData() {
        self.weatherService.getWeather(city: "Singapore", completion: { weather in
            DispatchQueue.main.async{
                self.cityLabel.text = weather.city.name
                let currentWeather = weather.list[0].main
                
                self.tempLabel.text = "\(SharedData.sharedData.kelvinToCelcius(temp: currentWeather.temp))°"
                self.weatherDescLabel.text = (weather.list[0].weather[0].description).capitalized
                
                self.weatherTableVC.dailyForecast = weather.list
                self.weatherDailyTableView.reloadData()
                
                self.weatherDailyTableView.refreshControl?.endRefreshing()
            }
        })
    }
}

