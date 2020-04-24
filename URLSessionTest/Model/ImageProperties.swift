//
//  ImageProperties.swift
//  URLSessionTest
//
//  Created by Dennis Nesanoff on 24.04.2020.
//  Copyright © 2020 Dennis Nesanoff. All rights reserved.
//

import UIKit

struct ImageProperties {
    let key: String
    let data: Data
    
    init?(withImage image: UIImage, forKey key: String) {
        self.key = key
        guard let data = image.jpegData(compressionQuality: 1.0) else { return nil}
        self.data = data
    }
}
