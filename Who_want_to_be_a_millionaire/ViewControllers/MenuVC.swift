//
//  MenuVC.swift
//  Who_want_to_be_a_millionaire
//
//  Created by Сергей Черных on 16.12.2021.
//

import UIKit

class MenuVC: UIViewController {
    @IBOutlet weak var startGameButton: UIButton!
    @IBOutlet weak var resultsButton: UIButton!
    @IBOutlet weak var difficultyControl: UISegmentedControl!
    
    private var selectedDifficulty: Difficulty {
        switch self.difficultyControl.selectedSegmentIndex {
        case 0:
            return .easy
        case 1:
            return .hard
        default:
            return .easy
        }
    }
    
    override func loadView() {
        super.loadView()
        startGameButton.layer.cornerRadius = startGameButton.bounds.height / 4
        resultsButton.layer.cornerRadius = resultsButton.bounds.height / 4
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "startGameSegue":
            guard let gameVC = segue.destination as? GameVC else { return }
            gameVC.difficulty = self.selectedDifficulty
        default:
            break
        }
    }


}

