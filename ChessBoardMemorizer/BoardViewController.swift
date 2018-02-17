//
//  BoardViewController.swift
//  ChessBoardMemorizer
//
//  Created by Artur Honzawa  on 17/02/2018.
//  Copyright © 2018 Artur Honzawa . All rights reserved.
//

import UIKit

class BoardViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
}

extension BoardViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int)
        -> Int
    {
        return 64
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath)
        -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: SquareCell.identifier,
            for: indexPath)
            as! SquareCell
        cell.indexPath = indexPath
        return cell
    }
}

extension BoardViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath)
        -> CGSize
    {
        let side = collectionView.bounds.width / 8
        return CGSize(width: side, height: side)
    }
}

enum SquareColor {
    case dark, light
}

class SquareCell: UICollectionViewCell {
    
    
    static let identifier = "SquareCell"
    
    @IBOutlet weak var label: UILabel!
    
    var file: Int { return indexPath.row % 8 }
    var rank: Int { return 7 - indexPath.row / 8 }
    
    var name: String {
        let fileNames = ["a", "b", "c", "d", "e", "f", "g", "h"]
        let rankNames = ["1", "2", "3", "4", "5", "6", "7", "8"]
        let fileName = fileNames[file]
        let rankName = rankNames[rank]
        
        return "\(fileName)\(rankName)"
    }
    
    var squareColor: SquareColor {
        return (rank + file) % 2 == 0
            ? .dark
            : .light
    }
    
    var indexPath: IndexPath! {
        didSet {
            switch squareColor {
            case .dark:
                backgroundColor = UIColor.black
            case .light:
                backgroundColor = UIColor.white
            }
            
            label.text = name
        }
    }
}
