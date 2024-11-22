//
//  ActivitySummary.swift
//  WatchTest
//
//  Created by samh on 10/10/2024.
//

import Foundation

struct ActivitySummary {
    let move: Double
    let excercise: Double
    let stand: Double
    
    init(move: Double = 0, excercise: Double = 0, stand: Double = 0) {
        self.move = move
        self.excercise = excercise
        self.stand = stand
    }
}
