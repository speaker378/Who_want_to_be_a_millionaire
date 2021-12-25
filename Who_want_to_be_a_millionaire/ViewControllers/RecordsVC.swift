//
//  RecordsVC.swift
//  Who_want_to_be_a_millionaire
//
//  Created by Сергей Черных on 17.12.2021.
//

import UIKit

class RecordsVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }

}

extension RecordsVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Game.shared.records.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        let record = Game.shared.records[indexPath.row]
        cell.textLabel?.text = "Верных ответов: \(record.counterOfCorrectAnswers) из \(record.allQuestionsCount) вопросов"
        cell.detailTextLabel?.text = "\(record.percent)%"
        return cell
    }
    
}

extension RecordsVC: UITableViewDelegate {
    
}
