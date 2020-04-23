//
//  ImageViewController.swift
//  URLSessionTest
//
//  Created by Dennis Nesanoff on 23.04.2020.
//  Copyright © 2020 Dennis Nesanoff. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {
    // MARK: - Private methods
    private let imageString = "https://i.pinimg.com/originals/5f/24/e5/5f24e5f1815c2fb4221dbcef1361168a.jpg"
    
    // MARK: - IBOutlets
    @IBOutlet var image: UIImageView!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    // MARK: - Override methods
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
        
        fetchData()
    }
    
    // MARK: - Private methods
    private func fetchData() {
        guard let url = URL(string: imageString) else { return }
        
        let session = URLSession.shared
        session.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error)
                return
            }
            
            if let response = response {
                print(response)
            }
            
            if let data = data, let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.image.image = image
                    self.activityIndicator.stopAnimating()
                }
            }
        }.resume()
    }
}
