//
//  AlamofireNetwork.swift
//  URLSessionTest
//
//  Created by Dennis Nesanoff on 25.04.2020.
//  Copyright © 2020 Dennis Nesanoff. All rights reserved.
//

import Foundation
import Alamofire


class AlamofireNetworkManager {
    
    static func fetchDataWithAlamofire(cities: [String], completion: @escaping (_ weatherOfCities: [Weather]) -> ()) {
        var weatherOfCities: [Weather] = []
        
        for cityName in cities {
            let urlString = "https://api.openweathermap.org/data/2.5/weather?appid=e6a1c5270312f2cc57f976cf3fe77dc6&units=metric&q=\(cityName)"
            guard let url = URL(string: urlString) else { return }
            
            AF.request(url).validate().responseJSON { dataResponse in
                switch dataResponse.result {
                case .success( _):
                    do {
                        let weather = try JSONDecoder().decode(Weather.self, from: dataResponse.data!)
                        weatherOfCities.append(weather)
                        completion(weatherOfCities)
                    } catch let error as NSError {
                        print("Failed to load: \(error.localizedDescription)")
                    }
                case .failure(let error):
                    print("Request error: \(error.localizedDescription)")
                }
            }
        }
    }
}
