//
//  TestTuringSafeDictionaryExcludingSpec.swift
//  TuringSafe_Tests
//
//  Created by Dmitry Rybochkin on 17/04/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Quick
import Nimble
import TuringSafeDictionary

final class TestTuringSafeDictionaryExcludingSpec: QuickSpec {

    // MARK: - Types

    typealias SafeDictionary = TuringSafeDictionary<String, Int>

    // MARK: - Life cycle

    override func spec() {
        describe("these will success") {
            it("test func dropFirst(_ count: Int = 1) -> TuringSafeDictionary<Key, Value>") {
                let testDictionary = ["1": 1, "2": 2, "3": 1, "4": 5, "5": 1, "6": 3]
                let safeDictionary = SafeDictionary(dictionary: testDictionary)
                let droppedSafeDictionary = safeDictionary.dropFirst()
                let droppedTestDictionary = SafeDictionary(dictionary: testDictionary.dropFirst())
                expect(droppedSafeDictionary == droppedTestDictionary) == true
            }
            it("test func dropLast(_ count: Int = 1) -> TuringSafeDictionary<Key, Value>") {
                let testDictionary = ["1": 1, "2": 2, "3": 1, "4": 5, "5": 1, "6": 3]
                let safeDictionary = SafeDictionary(dictionary: testDictionary)
                let droppedSafeDictionary = safeDictionary.dropLast(2)
                let droppedTestDictionary = SafeDictionary(dictionary: testDictionary.dropLast(2))
                expect(droppedSafeDictionary == droppedTestDictionary) == true
            }
            //swiftlint:disable:next line_length
            it("test func drop(while predicate: (Element) throws -> Bool) rethrows -> TuringSafeDictionary<Key, Value>") {
                let testDictionary = ["1": 1, "2": 2, "3": 1, "4": 5, "5": 1, "6": 3]
                let safeDictionary = SafeDictionary(dictionary: testDictionary)
                let droppedSafeDictionary = safeDictionary.drop(while: { $0.value > 2 })
                let droppedTestDictionary = SafeDictionary(dictionary: testDictionary.drop(while: { $0.value > 2 }))
                expect(droppedSafeDictionary == droppedTestDictionary) == true
            }
        }
    }
}
