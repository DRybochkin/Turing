//
//  TestTuringSafeDictionaryComparingSpec.swift
//  TuringSafe_Tests
//
//  Created by Dmitry Rybochkin on 16/04/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Quick
import Nimble
import TuringSafeDictionary

final class TestTuringSafeDictionaryComparingSpec: QuickSpec {

    // MARK: - Life cycle

    override func spec() {
        describe("these will success") {
            it("test ==(lhs: TuringSafeDictionary<Key, Value>, rhs: TuringSafeDictionary<Key, Value>) -> Bool") {
                let safeDictionary1: TuringSafeDictionary<String, Int> = ["1": 1, "2": 2, "3": 1, "4": 5, "5": 1, "6": 3]
                let safeDictionary2: TuringSafeDictionary<String, Int> = ["1": 1, "2": 2, "3": 1, "4": 5, "5": 1, "6": 3]
                expect(safeDictionary1 == safeDictionary2) == true
                let safeDictionary3: TuringSafeDictionary<String, Int> = ["1": 1, "2": 2]
                expect(safeDictionary1 == safeDictionary3) == false
            }
            it("test !=(lhs: TuringSafeDictionary<Key, Value>, rhs: TuringSafeDictionary<Key, Value>) -> Bool") {
                let safeDictionary1: TuringSafeDictionary<String, Int> = ["1": 1, "2": 2, "3": 1, "4": 5, "5": 1, "6": 3]
                let safeDictionary2: TuringSafeDictionary<String, Int> = ["1": 1, "2": 2, "3": 1, "4": 5, "5": 1, "6": 3]
                expect(safeDictionary1 != safeDictionary2) == false
                let safeDictionary3: TuringSafeDictionary<String, Int> = ["1": 1, "2": 2]
                expect(safeDictionary1 != safeDictionary3) == true
            }
            it("test ==(lhs: TuringSafeDictionary<Key, Value>, rhs: DictionaryType) -> Bool") {
                let safeDictionary1: TuringSafeDictionary<String, Int> = ["1": 1, "2": 2, "3": 1, "4": 5, "5": 1, "6": 3]
                let safeDictionary2 = ["1": 1, "2": 2, "3": 1, "4": 5, "5": 1, "6": 3]
                expect(safeDictionary1 == safeDictionary2) == true
                let safeDictionary3 = ["1": 1, "2": 2]
                expect(safeDictionary1 == safeDictionary3) == false
            }
            it("test !=(lhs: TuringSafeDictionary<Key, Value>, rhs: DictionaryType) -> Bool") {
                let safeDictionary1: TuringSafeDictionary<String, Int> = ["1": 1, "2": 2, "3": 1, "4": 5, "5": 1, "6": 3]
                let safeDictionary2 = ["1": 1, "2": 2, "3": 1, "4": 5, "5": 1, "6": 3]
                expect(safeDictionary1 != safeDictionary2) == false
                let safeDictionary3 = ["1": 1, "2": 2]
                expect(safeDictionary1 != safeDictionary3) == true
            }
            it("test ==(lhs: DictionaryType, rhs: TuringSafeDictionary<Key, Value>) -> Bool") {
                let safeDictionary1 = ["1": 1, "2": 2, "3": 1, "4": 5, "5": 1, "6": 3]
                let safeDictionary2: TuringSafeDictionary<String, Int> = ["1": 1, "2": 2, "3": 1, "4": 5, "5": 1, "6": 3]
                expect(safeDictionary1 == safeDictionary2) == true
                let safeDictionary3: TuringSafeDictionary<String, Int> = ["1": 1, "2": 2]
                expect(safeDictionary1 == safeDictionary3) == false
            }
            it("test !=(lhs: DictionaryType, rhs: TuringSafeDictionary<Key, Value>) -> Bool") {
                let safeDictionary1 = ["1": 1, "2": 2, "3": 1, "4": 5, "5": 1, "6": 3]
                let safeDictionary2: TuringSafeDictionary<String, Int> = ["1": 1, "2": 2, "3": 1, "4": 5, "5": 1, "6": 3]
                expect(safeDictionary1 != safeDictionary2) == false
                let safeDictionary3: TuringSafeDictionary<String, Int> = ["1": 1, "2": 2]
                expect(safeDictionary1 != safeDictionary3) == true
            }
        }
    }
}
