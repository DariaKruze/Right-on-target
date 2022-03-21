//
//  GameRoundProtocol.swift
//  Right on target
//
//  Created by Даша Черняева on 24.12.2021.
//

import Foundation

protocol GameRoundProtocol {
    // Количество заработанных очков
    var score: Int { get }
    // Загаданное значение
    var currentSecretValue: Int {get}
    // Сравнивает переданное значение с загаданным и начисляет очки
    func calculateScore(with value: Int)
}
class GameRound : GameRoundProtocol {
    var score: Int = 0
    var currentSecretValue: Int = 0
    init(secretValue : Int) {
        currentSecretValue = secretValue
    }
    
    func calculateScore(with value: Int) {
        if value > currentSecretValue {
            score += 50 - value + currentSecretValue
        } else if value < currentSecretValue {
            score += 50 - currentSecretValue + value
        } else {
            score += 50
        }
    }
}
