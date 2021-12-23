//
//  Game.swift
//  Who_want_to_be_a_millionaire
//
//  Created by Сергей Черных on 16.12.2021.
//

import Foundation

final class Game {
    static let shared = Game()
    
    private let recordsCaretaker = RecordsCaretaker()
    private let questionsCaretaker = QuestionsCaretaker()
    var session: GameSession?
    var difficulty: Difficulty = .easy
    
    private(set) var records: [Record] {
        didSet {
            recordsCaretaker.save(records: self.records)
        }
    }
    private(set) var questions: [Question] {
        didSet {
            questionsCaretaker.save(questions: self.questions)
        }
    }
    
    private init() {
        self.records = self.recordsCaretaker.retrieveRecords()
        self.questions = self.questionsCaretaker.retrieveQuestions()
        testQuestions += self.questions
    }
    
    func saveRecord(_ record: Record) {
        self.records.append(record)
    }
    
    func saveQuestion(_ question: Question) {
        self.questions.append(question)
    }
}
