//
//  SettingsVC.swift
//  Who_want_to_be_a_millionaire
//
//  Created by Сергей Черных on 23.12.2021.
//

import UIKit

class SettingsVC: UIViewController {
    @IBOutlet weak var difficultyControl: UISegmentedControl!
    
    var selectedDifficulty: Difficulty {
        switch self.difficultyControl.selectedSegmentIndex {
        case 0:
            return .easy
        case 1:
            return .hard
        default:
            return .easy
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        difficultyControl.selectedSegmentIndex = Game.shared.difficulty == .easy ? 0 : 1
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        Game.shared.difficulty = selectedDifficulty
    }

}
