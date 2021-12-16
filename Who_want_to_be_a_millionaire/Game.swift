//
//  Game.swift
//  Who_want_to_be_a_millionaire
//
//  Created by Сергей Черных on 16.12.2021.
//

import Foundation

final class Game {
    static let shared = Game()
    var session: GameSession?
    
    private init() { }
}
