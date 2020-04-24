//
//  Weather.swift
//  URLSessionTest
//
//  Created by Dennis Nesanoff on 24.04.2020.
//  Copyright © 2020 Dennis Nesanoff. All rights reserved.
//

import Foundation

struct Weather: Decodable {
    var name: String
    var main: Main
}

struct Main: Decodable {
    var temp: Double
}
