//
//  GameVC.swift
//  Who_want_to_be_a_millionaire
//
//  Created by Сергей Черных on 16.12.2021.
//

import UIKit

class GameVC: UIViewController {
    
    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var buttonsStack: UIStackView!
    @IBOutlet weak var answerButtonA: UIButton!
    @IBOutlet weak var answerButtonB: UIButton!
    @IBOutlet weak var answerButtonC: UIButton!
    @IBOutlet weak var answerButtonD: UIButton!
    
    var questions: [Question]!
    var session: GameSession!
    var truth: String!
    var difficulty: Difficulty!
    
    private var createQuestionsStrategy: OrderOfQuestionsStrategy {
        switch self.difficulty {
        case .easy:
            return DirectOrder()
        case .hard:
            return RandomQuestions()
        case .none:
            return DirectOrder()
        }
    }
    
    override func loadView() {
        super.loadView()
        buttonsStack.subviews.forEach { button in
            button.layer.cornerRadius = button.bounds.height / 4
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        session = GameSession(orderOfQuestions: createQuestionsStrategy)
        session.gameVCDelegate = self
        Game.shared.session = session
        questions = session.orderOfQuestions.orderOfQuestions(questions: testQuestions)
        
        session.numberQuestion.addObserver(self,
                                        options: [.new, .initial],
                                        closure: { [weak self] (numberQuestion, _) in
            var percent: Float = 0
            if self?.session.percentageProgress.isNaN == false {
                percent = (self?.session.percentageProgress)!
                
            }
            self?.progressLabel.text = "Прогресс: \(numberQuestion) (\(percent)%)" }
        )
        
        setAllQuestionsCount(questions.count)
        setActionForButtons()
        setTextQuestion(session.numberQuestion.value)
        setTextForButtons(session.numberQuestion.value)
        setTruth(session.numberQuestion.value)
    }
    
    private func setTextQuestion(_ questionNumber: Int) {
        let question = questions[questionNumber]
        questionLabel.text = question.question
    }
    
    private func setTextForButtons(_ questionNumber: Int) {
        let question = questions[questionNumber]
        var answerNum = 0
        buttonsStack.subviews.forEach { button in
            guard let button = button as? UIButton else { return }
            button.setTitle(question.answerOptions[answerNum].text, for: .normal)
            answerNum += 1
        }
    }
    
    private func setTruth(_ questionNumber: Int) {
        let answers = questions[questionNumber].answerOptions
        answers.forEach { answer in
            if answer.truth {
                truth = answer.text
            }
        }
    }
    
    private func setActionForButtons() {
        buttonsStack.subviews.forEach { button in
            guard let button = button as? UIButton else { return }
            button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        }
    }
    
    @objc private func buttonAction(_ sender: UIButton) {
        guard let text = sender.currentTitle else { return }
        if truth == text {
            scorePoints()
            nextQuestions()
        } else {
            endGame()
        }
    }
    
    private func nextQuestions() {
        session.numberQuestion.value += 1
        guard session.numberQuestion.value < questions.count else { endGame(); return }
        setTextQuestion(session.numberQuestion.value)
        setTextForButtons(session.numberQuestion.value)
        setTruth(session.numberQuestion.value)
    }
    
    private func endGame() {
        let record = Record(counterOfCorrectAnswers: session.numberQuestion.value, allQuestionsCount: session.allQuestionsCount)
        Game.shared.saveRecord(record)
        Game.shared.session = nil
        self.dismiss(animated: true, completion: nil)
    }

}

extension GameVC: GameVCDelegate {
    func scorePoints(_ points: Int = 1) {
        session.points += points
    }
    
    func setAllQuestionsCount(_ count: Int) {
        session.allQuestionsCount = count
    }
}
