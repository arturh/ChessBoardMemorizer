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
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 64
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: SquareCell.identifier,
            for: indexPath)
            as! SquareCell
        return cell
    }
    
    
}

extension BoardViewController: UICollectionViewDelegateFlowLayout {
    
}

class SquareCell: UICollectionViewCell {
    static let identifier = "SquareCell"
}
