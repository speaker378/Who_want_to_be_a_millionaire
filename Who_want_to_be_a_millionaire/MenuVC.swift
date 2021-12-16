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
    
    override func loadView() {
        super.loadView()
        startGameButton.layer.cornerRadius = startGameButton.bounds.height / 4
        resultsButton.layer.cornerRadius = resultsButton.bounds.height / 4
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


}

