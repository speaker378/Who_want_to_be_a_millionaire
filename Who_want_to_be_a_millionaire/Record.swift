//
//  Record.swift
//  Who_want_to_be_a_millionaire
//
//  Created by Сергей Черных on 17.12.2021.
//

import Foundation

struct Record: Codable {
    var counterOfCorrectAnswers: Int
    var allQuestionsCount: Int
    var percent: Float {
        (Float(self.counterOfCorrectAnswers) / Float(self.allQuestionsCount) * 100).rounded()
        
    }
}
