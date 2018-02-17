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
    @IBOutlet weak var label: UILabel!
    
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
        let cell = collectionView
            .dequeueReusableCell(
                withReuseIdentifier: SquareCell.identifier,
                for: indexPath)
            as! SquareCell
        cell.square = square(from: indexPath)
        return cell
    }
    
    func square(from indexPath: IndexPath) -> Square {
        return Square(file: indexPath.row % 8, rank: 7 - indexPath.row / 8)
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
    
    func collectionView(
        _ collectionView: UICollectionView,
        didSelectItemAt indexPath: IndexPath)
    {
        label.text = square(from: indexPath).name
    }
}



struct Square {
    let file: Int
    let rank: Int
}

extension Square {
    enum Color {
        case dark, light
    }
    
    var color: Color {
        return (rank + file) % 2 == 0
            ? .dark
            : .light
    }
    
    var name: String {
        let fileNames = ["a", "b", "c", "d", "e", "f", "g", "h"]
        let rankNames = ["1", "2", "3", "4", "5", "6", "7", "8"]
        
        let fileName = fileNames[file]
        let rankName = rankNames[rank]
        
        return "\(fileName)\(rankName)"
    }
}

class SquareCell: UICollectionViewCell {
    static let identifier = "SquareCell"
    
    @IBOutlet weak var label: UILabel!
    
    var square: Square! {
        didSet {
            switch square.color {
            case .dark:
                backgroundColor = UIColor.black
            case .light:
                backgroundColor = UIColor.white
            }
            label.text = square.name
        }
    }
}
