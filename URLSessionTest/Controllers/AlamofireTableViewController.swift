//
//  AlamofireTableViewController.swift
//  URLSessionTest
//
//  Created by Dennis Nesanoff on 25.04.2020.
//  Copyright © 2020 Dennis Nesanoff. All rights reserved.
//

import UIKit
import Alamofire

class AlamofireTableViewController: UITableViewController {
    private let cities = ["London", "Paris", "Moscow", "Rome", "New%20York"]
    var weatherOfCities: [Weather] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        NetworkManager.fetchData(cities: cities) { (weatherOfCities) in
//            self.weatherOfCities = weatherOfCities
        //
        //            DispatchQueue.main.async {
        //                self.tableView.reloadData()
        //            }
        //        }
        
        AlamofireNetworkManager.fetchDataWithAlamofire(cities: cities) { weatherOfCities in
            self.weatherOfCities = weatherOfCities
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    //    func fetchDataWithAlamofire(cities: [String]) {
    //        let jsonUrlString = "https://api.openweathermap.org/data/2.5/weather?appid=e6a1c5270312f2cc57f976cf3fe77dc6&units=metric&q=London"
    //
    //        AlamofireNetworkManager.sendRequest(urlString: jsonUrlString)
    //    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherOfCities.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        configureCell(for: cell, for: indexPath)
        
        return cell
    }
    
    private func configureCell(for cell: UITableViewCell, for indexPath: IndexPath) {
        let weather = weatherOfCities[indexPath.row]
        
        DispatchQueue.main.async {
            cell.textLabel?.text = weather.name
            cell.detailTextLabel?.text = "\(weather.main.temp)"
        }
    }
    
    
}
