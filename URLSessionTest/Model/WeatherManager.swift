//
//  WeatherManager.swift
//  URLSessionTest
//
//  Created by Dennis Nesanoff on 23.04.2020.
//  Copyright © 2020 Dennis Nesanoff. All rights reserved.
//

import Foundation

struct WeatherManager {
    static var shared = WeatherManager()
    
    func createWeatherModels() -> [WeatherModel] {
        var cityNames = ["London", "Moskow", "New York", "Tokio", "Paris"]
        var weatherModels: [WeatherModel] = []
        for city in cityNames {
            var stringUrl = "https://api.openweathermap.org/data/2.5/weather?appid=e6a1c5270312f2cc57f976cf3fe77dc6&units=metric&q=\(city)"
            
            if let weatherModel = fetchData(path: stringUrl) {
                weatherModels.append(weatherModel)
            }
        }
        print(weatherModels)
        return weatherModels
    }
    
    // URL
    func fetchData(path: String) -> WeatherModel? {
        guard let url = URL(string: path) else { return nil }
        var weatherModel: WeatherModel?
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                print(error)
                return
            }
            DispatchQueue.main.async {
                guard let data = data else { return }
                guard let weather = self.parseJSON(data) else { return }
                weatherModel = WeatherModel(cityName: weather.name, temperature: weather.main.temp, imageID: weather.weather[0].id)
            }
        }.resume()
        print(weatherModel)
        return weatherModel
    }
    
    // Parse JSON
    func parseJSON(_ data: Data) -> WeatherDataModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherDataModel.self, from: data)
            return decodedData
        } catch let error {
            print(error)
            return nil
        }
    }
}
