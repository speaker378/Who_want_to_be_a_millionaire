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
    
    weak var gameVCDelegate: GameVCDelegate?
    
    var counterOfCorrectAnswers: Int = 0
    var allQuestionsCount: Int = 0
    
}
