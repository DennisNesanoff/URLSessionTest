//
//  NetworkManager.swift
//  URLSessionTest
//
//  Created by Dennis Nesanoff on 24.04.2020.
//  Copyright © 2020 Dennis Nesanoff. All rights reserved.
//

import UIKit

class NetworkManager {
    
    static func downloadImage(urlString: String, completion: @escaping (_ image: UIImage) -> ()) {
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error)
                return
            }
            
            if let response = response, let data = data, let image = UIImage(data: data) {
                print(response)
                DispatchQueue.main.async {
                    completion(image)
                }
            }
        }.resume()
    }
    
    static func getRequest(urlString: String) {
        guard let url = URL(string: urlString) else { return }
        let session = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let response = response, let data = data else { return }
            print(response)
            
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                print(json)
            } catch {
                print(error)
            }
        }
        session.resume()
    }
    
    static func postRequest(urlString: String) {
        guard let url = URL(string: urlString) else { return }
        let userData = ["Title": "Networking", "Text": "GET and POST requests"]
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        guard let httpBody = try? JSONSerialization.data(withJSONObject: userData, options: []) else { return }
        request.httpBody = httpBody
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let response = response, let data = data else { return }
            print(response)
            
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                print(json)
            } catch {
                print(error)
            }
        }.resume()
    }
    
    static func fetchData(cities: [String], completion: @escaping (_ weatherOfCities: [Weather]) -> ()) {
        var weatherOfCities: [Weather] = []
        
        for cityName in cities {
            let jsonUrlString = "https://api.openweathermap.org/data/2.5/weather?appid=e6a1c5270312f2cc57f976cf3fe77dc6&units=metric&q=\(cityName)"
            guard let url = URL(string: jsonUrlString) else { return }
            
            URLSession.shared.dataTask(with: url) { data, _, _ in
                guard let data = data else { return }
                
                do {
                    let weather = try JSONDecoder().decode(Weather.self, from: data)
                    weatherOfCities.append(weather)
                    completion(weatherOfCities)
                } catch let error {
                    print("Error serialisation json", error)
                }
            }.resume()
        }
    }
    
    static func uploadImage(url: String) {
        let image = UIImage(named: "Jobs")!
        let httpHeaders = ["Authorization": "Client-ID 8fa714b27d5fab6"]
        
        guard let imageProperties = ImageProperties(withImage: image, forKey: "image") else { return }
        guard let url = URL(string: url) else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = httpHeaders
        request.httpBody = imageProperties.data
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let response = response, let data = data else { return }
            print(response)
            
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                print(json)
            } catch {
                print(error)
            }
        }.resume()
    }
}
