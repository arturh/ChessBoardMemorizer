//
//  SquareCell.swift
//  ChessBoardMemorizer
//
//  Created by Artur Honzawa  on 17/02/2018.
//  Copyright © 2018 Artur Honzawa . All rights reserved.
//

import UIKit

class SquareCell: UICollectionViewCell {
    static let identifier = "SquareCell"
    
    @IBOutlet weak var label: UILabel!
    
    var shouldShowSquareNames: Bool = false
    var square: Square! {
        didSet {
            switch square.color {
            case .dark:
                backgroundColor = UIColor.black
            case .light:
                backgroundColor = UIColor.white
            }
            
            label.text = shouldShowSquareNames
                ? square.name
                : nil
        }
    }
}
