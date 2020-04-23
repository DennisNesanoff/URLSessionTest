//
//  WeatherViewController.swift
//  URLSessionTest
//
//  Created by Dennis Nesanoff on 23.04.2020.
//  Copyright © 2020 Dennis Nesanoff. All rights reserved.
//

import UIKit

class WeatherViewController: UITableViewController {
    var weathers = WeatherManager.shared.createWeatherModels()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addCity))
    }

    @objc func addCity() {
        // Добавление погоды нового города
        
//        tableView.reloadData()
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weathers.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.imageView?.image = UIImage(systemName: "\(weathers[indexPath.row].imageID)")
        cell.textLabel?.text = weathers[indexPath.row].cityName
        cell.detailTextLabel?.text = String(weathers[indexPath.row].temperature)
        
        return cell
    }
}
