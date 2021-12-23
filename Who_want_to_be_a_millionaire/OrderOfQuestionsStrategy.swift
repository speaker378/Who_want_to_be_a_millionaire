//
//  OrderOfQuestionsStrategy.swift
//  Who_want_to_be_a_millionaire
//
//  Created by Сергей Черных on 23.12.2021.
//

import Foundation

protocol OrderOfQuestionsStrategy {
    func orderOfQuestions(questions: [Question]) -> [Question]
}

final class RandomQuestions: OrderOfQuestionsStrategy {
    func orderOfQuestions(questions: [Question]) -> [Question] {
        return questions.shuffled()
    }
}

final class DirectOrder: OrderOfQuestionsStrategy {
    func orderOfQuestions(questions: [Question]) -> [Question] {
        return questions
    }
}
