//
//  TableViewController.swift
//  URLSessionTest
//
//  Created by Dennis Nesanoff on 23.04.2020.
//  Copyright © 2020 Dennis Nesanoff. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    private let cities = ["London", "Paris", "Moscow", "Rome", "New%20York"]
    var weatherOfCities: [Weather] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NetworkManager.fetchData(cities: cities) { (weatherOfCities) in
            self.weatherOfCities = weatherOfCities
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
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
