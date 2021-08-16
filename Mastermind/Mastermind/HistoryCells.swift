//
//  TableViewCell.swift
//  Mastermind
//
//  Created by Brian Ooi on 8/11/21.
//

import Foundation
import UIKit

class HistoryCells: UITableViewCell {
    @IBOutlet var guess1: UIImageView!
    @IBOutlet var guess2: UIImageView!
    @IBOutlet var guess3: UIImageView!
    @IBOutlet var guess4: UIImageView!
    @IBOutlet var correctPosLabel: UILabel!
    @IBOutlet var correctColorLabel: UILabel!
    @IBOutlet var guessLabel: UILabel!
    
    func configure(guess: Guess, count: Int) {
        guess1.tintColor = guess.guesses[0]
        guess2.tintColor = guess.guesses[1]
        guess3.tintColor = guess.guesses[2]
        guess4.tintColor = guess.guesses[3]
        guessLabel.text = String(format: "#%02d", count)
        correctPosLabel.text = String(guess.results.correctPositions)
        correctColorLabel.text = String(guess.results.correctColors)
    }
}
