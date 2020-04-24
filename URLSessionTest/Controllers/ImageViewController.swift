//
//  ImageViewController.swift
//  URLSessionTest
//
//  Created by Dennis Nesanoff on 23.04.2020.
//  Copyright © 2020 Dennis Nesanoff. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {
    private let urlString = "https://i.pinimg.com/originals/5f/24/e5/5f24e5f1815c2fb4221dbcef1361168a.jpg"
    
    @IBOutlet var image: UIImageView!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchData()
    }
    
    private func fetchData() {
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
        
        NetworkManager.downloadImage(urlString: urlString) { image in
            self.activityIndicator.stopAnimating()
            self.image.image = image
        }
    }
}
