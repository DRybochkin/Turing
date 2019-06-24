//
//  TestTuringSafeDictionaryReorderingSpec.swift
//  TuringSafe_Tests
//
//  Created by Dmitry Rybochkin on 16/04/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Quick
import Nimble
import TuringSafeDictionary

final class TestTuringSafeDictionaryReorderingSpec: QuickSpec {

    // MARK: - Life cycle

    override func spec() {
        describe("these will success") {
            it("test func reversed() -> [Element]") {
                let safeDictionary: TuringSafeDictionary<String, Int> = ["1": 1, "2": 2, "3": 1, "4": 5, "5": 1, "6": 3]
                let safeReversedDictionary = TuringSafeDictionary<String, Int>(dictionary: safeDictionary.reversed())
                expect(safeDictionary == safeReversedDictionary) == true
            }
            it("test func shuffled() -> TuringSafeDictionary<Key, Value>") {
                let safeDictionary: TuringSafeDictionary<String, Int> = ["1": 1, "2": 2, "3": 1, "4": 5, "5": 1, "6": 3]
                let shuffledSafeDictionary = TuringSafeDictionary<String, Int>(dictionary: safeDictionary.shuffled())
                expect(safeDictionary == shuffledSafeDictionary) == true
            }
            it("test func shuffled() -> [Element]") {
                let testDictionary = ["1": 1, "2": 2, "3": 1, "4": 5, "5": 1, "6": 3]
                let safeDictionary = TuringSafeDictionary<String, Int>(dictionary: testDictionary)
                let shuffledSafeDictionary = TuringSafeDictionary<String, Int>(dictionary: safeDictionary.shuffled())
                let shuffledTestDictionary = TuringSafeDictionary<String, Int>(dictionary: testDictionary.shuffled())
                expect(shuffledTestDictionary == shuffledSafeDictionary) == true
            }
        }
    }
}
