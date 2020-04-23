//
//  WeatherDataModel.swift
//  URLSessionTest
//
//  Created by Dennis Nesanoff on 23.04.2020.
//  Copyright © 2020 Dennis Nesanoff. All rights reserved.
//

import Foundation

struct WeatherDataModel: Decodable {
    var name: String
    var main: Main
    var weather: [Weather]
}

struct Main: Decodable {
    var temp: Double
}

struct Weather: Decodable {
    var id: Int
}
