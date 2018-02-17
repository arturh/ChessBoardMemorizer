//
//  Square.swift
//  ChessBoardMemorizer
//
//  Created by Artur Honzawa  on 17/02/2018.
//  Copyright © 2018 Artur Honzawa . All rights reserved.
//

import Foundation


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

extension Square: Equatable {
    static func == (lhs: Square, rhs: Square) -> Bool {
        return lhs.file == rhs.file
            && lhs.rank == rhs.rank
    }
}
