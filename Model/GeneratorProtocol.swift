//
//  GeneratorProtocol.swift
//  Right on target
//
//  Created by Даша Черняева on 24.12.2021.
//

import Foundation

protocol GeneratorProtocol {
    func getRandomValue() -> Int
}
class NumberGenerator: GeneratorProtocol {
    private let startRangeValue: Int
    private let endRangeValue: Int
    init?(startValue: Int, endValue: Int) {
        guard startValue <= endValue else {
            return nil
        }
        startRangeValue = startValue
        endRangeValue = endValue
    }
    func getRandomValue() -> Int {
        (startRangeValue...endRangeValue).randomElement()!
    }
}
