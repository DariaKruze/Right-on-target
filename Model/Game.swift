//
//  Game.swift
//  Right on target
//
//  Created by Даша Черняева on 22.12.2021.
//

import Foundation

protocol GameProtocol {
    // Количество заработанных очков
    var score: Int { get }
    // Загаданное значение
   // var currentSecretValue: Int {get}
    // текущий раунд
    var currentRound : GameRoundProtocol! { get }
    // Проверяет, закончена ли игра
    var isGameEnded: Bool { get }
    var secretValueGenerator: GeneratorProtocol { get }
    // Начинает новую игру и сразу стартует первый раунд
    func restartGame ()
    // Начинает новый раунд (обновляет загаданное число)
    func startNewRound ()
    // Сравнивает переданное значение с загаданным и начисляет очки
  //  func calculateScore(with value: Int)
}

class Game: GameProtocol {
    
    var score: Int {
        var totalScore: Int = 0
        for round in self.rounds {
            totalScore += round.score
        }
        return totalScore
    }
    var currentRound: GameRoundProtocol!
    private var rounds: [GameRoundProtocol] = []
    var secretValueGenerator: GeneratorProtocol
    private var roundsCount: Int!
//    // Минимальное загаданное значение
//    private var minSecretValue: Int
//    // Максимальное загаданное значение
//    private var maxSecretValue: Int
//   // var currentSecretValue: Int = 0
//    // Количество раундов
//    private var lastRound: Int
//    private var currentRound: Int = 1
    var isGameEnded: Bool {
        if roundsCount == rounds.count {
            return true
        } else {
            return false
        }
    }
    
init(valueGenerator: GeneratorProtocol, rounds: Int) {
    secretValueGenerator = valueGenerator
    roundsCount = rounds
    startNewRound()
}
    
    func restartGame() {
        rounds = []
        startNewRound()
    }
    func startNewRound() {
        let newSecretValue = self.getNewSecretValue()
        currentRound = GameRound(secretValue: newSecretValue)
        rounds.append( currentRound )
    }
    
    // Загадать и вернуть новое случайное значение
    private func getNewSecretValue () -> Int {
        return secretValueGenerator.getRandomValue()
    }
}
    // Подсчитывает количество очков
//    func calculateScore(with value: Int) {
//        if value > currentSecretValue {
//            score += 50 - value + currentSecretValue
//        } else if value < currentSecretValue {
//            score += 50 - currentSecretValue + value
//        } else {
//            score += 50
//        }


