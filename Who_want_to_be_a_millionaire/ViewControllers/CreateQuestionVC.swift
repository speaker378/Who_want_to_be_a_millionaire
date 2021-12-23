//
//  CreateQuestionVC.swift
//  Who_want_to_be_a_millionaire
//
//  Created by Сергей Черных on 23.12.2021.
//

import UIKit

class CreateQuestionVC: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var questionTextView: UITextView!
    @IBOutlet weak var stackAnswersTextField: UIStackView!
    @IBOutlet weak var answerATextField: UITextField!
    @IBOutlet weak var answerBTextField: UITextField!
    @IBOutlet weak var answerCTextField: UITextField!
    @IBOutlet weak var answerDTextField: UITextField!
    @IBOutlet weak var truthControl: UISegmentedControl!
    @IBOutlet weak var addQuestionButton: UIButton!
    @IBAction func addQuestionPressed(_ sender: Any) {
        addNewQuestion()
        self.dismiss(animated: true, completion: nil)
    }
    
    override func loadView() {
        super.loadView()
        addQuestionButton.layer.cornerRadius = addQuestionButton.bounds.height / 4
        scrollView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(hideKeyboard)))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func addNewQuestion() {
        var flag: Bool
        var answers = [Answer(answerATextField.text ?? ""),
                       Answer(answerBTextField.text ?? ""),
                       Answer(answerCTextField.text ?? ""),
                       Answer(answerDTextField.text ?? "")]
        
        flag = questionTextView.text.isEmpty ? false : true
        answers.forEach { flag = $0.text.isEmpty ? false : true }
        guard flag else { return }
        
        answers[truthControl.selectedSegmentIndex].truth = true
        Game.shared.saveQuestion(Question(question: questionTextView.text, answerOptions: answers))
        testQuestions.append(Question(question: questionTextView.text, answerOptions: answers))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(self.keyboardWasShow),
            name: UIResponder.keyboardWillShowNotification,
            object: nil)
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(self.keyboardWillBeHidden(notification:)),
            name: UIResponder.keyboardWillHideNotification,
            object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(
            self,
            name: UIResponder.keyboardWillShowNotification,
            object: nil)
        NotificationCenter.default.removeObserver(
            self,
            name: UIResponder.keyboardWillHideNotification,
            object: nil)
    }

    //MARK: keyboard
    @objc func keyboardWasShow(notification: Notification) {
        let info = notification.userInfo! as NSDictionary
        let kbSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: kbSize.height, right: 0.0)
        
        scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
        UIView.animate(withDuration: 1) {
            self.scrollView.constraints.first(where: {$0.identifier == "keyboardShow"})?.priority = .required
            self.scrollView.constraints.first(where: {$0.identifier == "keyboardHide"})?.priority = .defaultHigh
            self.view.layoutIfNeeded()
        }
    }
    
    @objc func keyboardWillBeHidden(notification: Notification) {
        let contentInsets = UIEdgeInsets.zero
        scrollView.contentInset = contentInsets
        UIView.animate(withDuration: 1) {
            self.scrollView.constraints.first(where: {$0.identifier == "keyboardShow"})?.priority = .defaultHigh
            self.scrollView.constraints.first(where: {$0.identifier == "keyboardHide"})?.priority = .required
            self.view.layoutIfNeeded()
        }
    }
    
    @objc func hideKeyboard() {
        self.scrollView?.endEditing(true)
    }
}
