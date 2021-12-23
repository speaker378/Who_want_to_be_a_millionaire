//
//  GameSession.swift
//  Who_want_to_be_a_millionaire
//
//  Created by Сергей Черных on 16.12.2021.
//

import Foundation

protocol GameVCDelegate: AnyObject {
    func scorePoints(_ points: Int)
    func setAllQuestionsCount(_ count: Int)
}

class GameSession {
    let orderOfQuestions: OrderOfQuestionsStrategy
    weak var gameVCDelegate: GameVCDelegate?
    
    init(orderOfQuestions: OrderOfQuestionsStrategy) {
        self.orderOfQuestions = orderOfQuestions
    }
    
    var counterOfCorrectAnswers: Int = 0
    var allQuestionsCount: Int = 0
    
}
