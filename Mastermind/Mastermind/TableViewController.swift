//
//  TableViewController.swift
//  Mastermind
//
//  Created by Brian Ooi on 8/11/21.
//

import Foundation
import UIKit

class TableViewController: UITableViewController {
    private var allGuesses: [Guess] = []
    private var parentView: ViewController?

    func configure(parentView: ViewController) {
        self.parentView = parentView
    }
    
    func refreshAllGuesses() {
        allGuesses = []
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.rowHeight = 70
        guard let parentView = parentView else {
            fatalError("No parent view")
        }
        parentView.updateDelegate = self
        allGuesses = []
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allGuesses.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let currentGuess = allGuesses[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "HistoryCell", for: indexPath) as? HistoryCells else{
            fatalError("Invalid cell")
        }
        cell.configure(guess: currentGuess, count: indexPath.row + 1)
        return cell
    }
}

extension TableViewController: updateTableDelegate {
    func didTapSubmit(guess: Guess) {
        self.allGuesses.append(guess)
        tableView.reloadData()
    }
}
