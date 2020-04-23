//
//  MainViewController.swift
//  URLSessionTest
//
//  Created by Dennis Nesanoff on 23.04.2020.
//  Copyright © 2020 Dennis Nesanoff. All rights reserved.
//

import UIKit

enum UserActions: String, CaseIterable {
    case downloadImage = "Download Image"
    case showWeather = "Show Weather"
}

class MainViewController: UICollectionViewController {

    private let userActions = UserActions.allCases
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Navigation
    
}

// MARK: - UICollectionViewDataSource
extension MainViewController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return userActions.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
        cell.label.text = userActions[indexPath.row].rawValue
        return cell
    }
}

// MARK: - UICollectionViewDelegate
extension MainViewController {
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let userAction = userActions[indexPath.item]
        
        switch userAction {
        case .downloadImage:
            performSegue(withIdentifier: "ShowImage", sender: self)
        case .showWeather:
            performSegue(withIdentifier: "DetailSegue", sender: self)
        }
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension MainViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width - 48, height: 100)
    }
}
