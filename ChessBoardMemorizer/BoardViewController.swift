//
//  BoardViewController.swift
//  ChessBoardMemorizer
//
//  Created by Artur Honzawa  on 17/02/2018.
//  Copyright © 2018 Artur Honzawa . All rights reserved.
//

import UIKit
import GameKit

class BoardViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var label: UILabel!
    
    private var game: Game = Game()
    
    override func viewDidLoad() {
        collectionView.dataSource = self
        collectionView.delegate = self
        
        displaySquareList()
    }
    
    func displaySquareList() {
        label.text = game
            .upcomingSquares
            .map { $0.name }
            .joined(separator: ", ")
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
        
        cell.shouldShowSquareNames = game.shouldShowSquareNames
        cell.square = square(from: indexPath)
        
        return cell
    }
    
    func square(from indexPath: IndexPath) -> Square {
        return Square(
            file: indexPath.row % 8,
            rank: 7 - indexPath.row / 8)
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
        let selectedSquare = square(from: indexPath)
        switch game.process(selectedSquare) {
        case .hit:
            label.backgroundColor = UIColor.clear
            AudioServicesPlaySystemSound(1103)
        case .miss:
            label.backgroundColor = UIColor.red
            AudioServicesPlaySystemSound(1053);
        }
        
        displaySquareList()
        collectionView.reloadData()
    }
}

