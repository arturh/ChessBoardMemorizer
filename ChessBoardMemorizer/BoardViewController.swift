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

class SquareCell: UICollectionViewCell {
    static let identifier = "SquareCell"
    
    var rank: Int { return indexPath.row % 8 }
    var file: Int { return indexPath.row / 8 }
    var isBackgroundLight: Bool { return (rank + file) % 2 == 0 }
    
    var indexPath: IndexPath! {
        didSet {
            backgroundColor = isBackgroundLight
                ? UIColor.white
                : UIColor.black
            
        }
    }
}
