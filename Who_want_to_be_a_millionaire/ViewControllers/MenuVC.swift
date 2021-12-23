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
    @IBOutlet weak var buttonStack: UIStackView!
    
    override func loadView() {
        super.loadView()
        buttonStack.subviews.forEach { view in
            view.layer.cornerRadius = view.bounds.height / 4
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "startGameSegue":
            guard let gameVC = segue.destination as? GameVC else { return }
            gameVC.difficulty = Game.shared.difficulty
        default:
            break
        }
    }


}

