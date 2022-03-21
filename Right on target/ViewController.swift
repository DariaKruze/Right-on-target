//
//  ViewController.swift
//  Right on target
//
//  Created by Даша Черняева on 13.12.2021.
//

/* 1. Приложение случайным образом выбирает целое число от 1 до 50 и сообщает его игроку, выводя в текстовой метке.
2. Игрок устанавливает бегунок на слайдере в положение, которое, по его мнению, соответствует данному числу. При этом крайнее левое положение слайдера соответствует 1, крайнее правое – 50. Сложность состоит в том, что ориентироваться игроку приходится на глаз.
3. Игрок подтверждает выбранную позицию слайдера нажатием кнопки.
4. Приложение определяет, насколько близко к загаданному числу оказа- лось выбранное на слайдере значение, и вычисляет количество заработан- ных очков.
Одна игра длится пять раундов. Цель – набрать максимальное суммарное количество очков. */

import UIKit

class ViewController: UIViewController {
    // Сущность "Игра"
    var game: Game!
    
    // Элементы на сцене
    @IBOutlet var slider: UISlider!
    @IBOutlet var label: UILabel!

    
    // MARK: - Жизненный цикл
    override func viewDidLoad() {
        super.viewDidLoad()
        //создаем генератор случайных чисел
        let generator = NumberGenerator(startValue: 1, endValue: 50)!
        // Создаем экземпляр сущности "Игра"
        game = Game(valueGenerator: generator, rounds: 5)
        // Обновляем данные о текущем значении загаданного числа
        updateLabelWithSecretNumber(newText: String(game.currentRound.currentSecretValue))
    }
    
    
    // MARK: - Взаимодействие View - Model

    @IBAction func checkNumber () {
        // Высчитываем очки за раунд
        game.currentRound.calculateScore(with: Int(slider.value))
        
        // Проверяем, окончена ли игра
        if game.isGameEnded {
            showAlertWith(score: game.score)
            // Начинаем игру заново game.restartGame()
            game.restartGame()
        } else {
            game.startNewRound()
        }
        
        // Обновляем данные о текущем значении загаданного числа
        updateLabelWithSecretNumber(newText: String(game.currentRound.currentSecretValue))
    }

    // MARK: - Обновление View
    // Обновление текста загаданного числа
    func updateLabelWithSecretNumber(newText: String ) {
        label.text = newText
    }
            
    // Отображение всплывающего окна со счетом
    private func showAlertWith( score: Int ) {
        let alert = UIAlertController(
            title: "Игра окончена",
            message: "Вы заработали \(score) очков",
            preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Начать заново", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

