//
//  SquareList.swift
//  ChessBoardMemorizer
//
//  Created by Artur Honzawa  on 17/02/2018.
//  Copyright © 2018 Artur Honzawa . All rights reserved.
//

import Foundation
import GameKit

struct SquareList {
    private var squares: [Square] = []
    
    init() {
        fill()
    }
    
    var next: Square? { return squares.first }
}

extension SquareList {
    func asString() -> String {
        return squares
            .map { $0.name }
            .joined(separator: ", ")
    }
    
    mutating func pop() {
        squares.removeFirst()
    }
    
    private mutating func fill() {
        let fileSource = GKRandomDistribution(lowestValue: 0, highestValue: 7)
        let rankSource = GKRandomDistribution(lowestValue: 0, highestValue: 7)
        
        (0...100).forEach { _ in
            squares.append(
                Square(
                    file: fileSource.nextInt(),
                    rank: rankSource.nextInt()
                )
            )
        }
    }
}
