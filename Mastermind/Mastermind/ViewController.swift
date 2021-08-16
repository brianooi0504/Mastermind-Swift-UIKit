//
//  ViewController.swift
//  Mastermind
//
//  Created by Brian Ooi on 8/9/21.
//

import UIKit

protocol updateTableDelegate {
    func didTapSubmit(guess: Guess)
}

class ViewController: UIViewController {
    @IBOutlet var guess1: UIImageView!
    @IBOutlet var guess2: UIImageView!
    @IBOutlet var guess3: UIImageView!
    @IBOutlet var guess4: UIImageView!
    @IBOutlet var redGuess: UIButton!
    @IBOutlet var yellowGuess: UIButton!
    @IBOutlet var greenGuess: UIButton!
    @IBOutlet var blueGuess: UIButton!
    @IBOutlet var purpleGuess: UIButton!
    @IBOutlet var whiteGuess: UIButton!

    var updateDelegate: updateTableDelegate!
    var tableViewController: TableViewController!
    
    private let allColors: [UIColor] = [UIColor.red, UIColor.yellow, UIColor.green, UIColor.blue, UIColor.purple, UIColor.white]
    private var randomColors: [UIColor] = []
    private var guess = Guess()
    
    @IBAction func redPressed(_ sender: UIButton) {
        appendColor(color: UIColor.red)
        updateColor()
    }
    @IBAction func yellowPressed(_ sender: UIButton) {
        appendColor(color: UIColor.yellow)
        updateColor()
    }
    @IBAction func greenPressed(_ sender: UIButton) {
        appendColor(color: UIColor.green)
        updateColor()
    }
    @IBAction func bluePressed(_ sender: UIButton) {
        appendColor(color: UIColor.blue)
        updateColor()
    }
    @IBAction func purplePressed(_ sender: UIButton) {
        appendColor(color: UIColor.purple)
        updateColor()
    }
    @IBAction func whitePressed(_ sender: UIButton) {
        appendColor(color: UIColor.white)
        updateColor()
    }
    @IBAction func clearPressed(_ sender: UIButton) {
        guess.guesses = [UIColor?](repeating: nil, count: 4)
        updateColor()
    }
    @IBAction func submitPressed(_ sender: UIButton) {
        var newGuessesList: [UIColor] = []
        for i in 0..<guess.guesses.count {
            if let guess = guess.guesses[i] {
                newGuessesList.append(guess)
            }
        }
        if newGuessesList.count == 4 {
            guess.results = compareGuesses(ans: randomColors, guesses: newGuessesList)
            updateDelegate.didTapSubmit(guess: guess)
            submitIsDone()
        }
    }
    @IBAction func restartPressed(_ sender: UIBarButtonItem) {
        randomiseColors(num: 4)
        guess = Guess()
        updateColor()
        tableViewController.refreshAllGuesses()
        tableViewController.tableView.reloadData()
    }
    
    func appendColor(color: UIColor) {
        if let index = guess.guesses.firstIndex(of: nil) {
            guess.guesses[index] = color
        }
    }
    
    func changeColor(_ icon: UIImageView, index: Int) {
        if let color = guess.guesses[index] {
            icon.tintColor = color
        } else {
            icon.tintColor = UIColor.lightGray
        }
    }
    
    func updateColor() {
        changeColor(guess1, index: 0)
        changeColor(guess2, index: 1)
        changeColor(guess3, index: 2)
        changeColor(guess4, index: 3)
    }
    
    func randomiseColors(num: Int) {
        randomColors = []
        for _ in 1...num {
            randomColors.append(allColors.randomElement()!)
        }
    }
    
    func submitIsDone() {
        guess = Guess()
        updateColor()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        randomiseColors(num: 4)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "HistoryTableSegue" {
            let destination = segue.destination as! TableViewController
            destination.configure(parentView: self)
            self.tableViewController = destination
        }
    }
}
