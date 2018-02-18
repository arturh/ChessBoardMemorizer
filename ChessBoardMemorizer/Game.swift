//
//  SquareList.swift
//  ChessBoardMemorizer
//
//  Created by Artur Honzawa  on 17/02/2018.
//  Copyright © 2018 Artur Honzawa . All rights reserved.
//

import Foundation
import GameKit

struct Game {
    var upcomingSquares: [Square] = []
    
    var missed: Int = 0
    var hitStreak: Int = 0
    var shouldShowSquareNames: Bool = true
    
    init() {
        fill(n: 100)
    }
    
    var next: Square? { return upcomingSquares.first }
}

extension Game {
    enum Result {
        case hit, miss
    }
    
    mutating func process(_ square: Square) -> Result {
        if .some(square) == next {
            hitStreak += 1
            missed = 0
            upcomingSquares.removeFirst()
            shouldShowSquareNames = shouldShowSquareNames && hitStreak == 1
            
            return .hit
        } else {
            hitStreak = 0
            missed += 1
            shouldShowSquareNames = missed > 1
            
            return .miss
        }
    }
    
    private mutating func fill(n: Int) {
        let fileSource = GKRandomDistribution(lowestValue: 0, highestValue: 7)
        let rankSource = GKRandomDistribution(lowestValue: 0, highestValue: 7)
        
        (0...n).forEach { _ in
            upcomingSquares.append(
                Square(
                    file: fileSource.nextInt(),
                    rank: rankSource.nextInt()
                )
            )
        }
    }
}
