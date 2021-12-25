//
//  RecordsCaretaker.swift
//  Who_want_to_be_a_millionaire
//
//  Created by Сергей Черных on 17.12.2021.
//

import Foundation

final class RecordsCaretaker {
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    private let key = "records"
    
    func save(records: [Record]) {
        do {
            let data = try self.encoder.encode(records)
            UserDefaults.standard.set(data, forKey: key)
        }
        catch {
            print(error)
        }
    }
    
    func retrieveRecords() -> [Record] {
        guard let data = UserDefaults.standard.data(forKey: key) else {
            return [] }
        do {
            return try self.decoder.decode([Record].self, from: data)
        }
        catch {
            print(error)
            return []
        }
    }
    
}
