//
//  Guesses.swift
//  Mastermind
//
//  Created by Brian Ooi on 8/10/21.
//

import Foundation
import UIKit

class Guess {
    var guesses: [UIColor?]
    var results: (correctPositions: Int, correctColors: Int)
    
    init(guesses: [UIColor?] = [UIColor?](repeating: nil, count: 4), results: (Int, Int) = (0,0)) {
        self.guesses = guesses
        self.results = results
    }
}

func compareGuesses(ans: [UIColor], guesses: [UIColor]) -> (Int, Int) {
    let ans = ans
    let guesses = guesses
    var correctPos: Int = 0
    var correctColor: Int = 0
    var newAns: [UIColor] = []
    var newGuesses: [UIColor] = []
    
    for i in 0..<ans.count {
        if ans[i] == guesses[i] {
            correctPos += 1
        } else {
            newAns.append(ans[i])
            newGuesses.append(guesses[i])
        }
    }
    
    for i in 0..<newGuesses.count {
        if newAns.contains(newGuesses[i]) {
            correctColor += 1
            if let index = newAns.firstIndex(of: newGuesses[i]) {
                newAns.remove(at: index)
            }
        }
    }
    
    return (correctPos, correctColor)
}
