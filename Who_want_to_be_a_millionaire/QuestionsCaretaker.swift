//
//  QuestionsCaretaker.swift
//  Who_want_to_be_a_millionaire
//
//  Created by Сергей Черных on 23.12.2021.
//

import Foundation

final class QuestionsCaretaker {
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    private let key = "question"
    
    func save(questions: [Question]) {
        do {
            let data = try self.encoder.encode(questions)
            UserDefaults.standard.set(data, forKey: key)
        }
        catch {
            print(error)
        }
    }
    
    func retrieveQuestions() -> [Question] {
        guard let data = UserDefaults.standard.data(forKey: key) else {
            return [] }
        do {
            return try self.decoder.decode([Question].self, from: data)
        }
        catch {
            print(error)
            return []
        }
    }
    
}
