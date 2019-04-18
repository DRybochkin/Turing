//
//  TestTuringSafeDictionarySelectingSpec.swift
//  TuringSafe_Tests
//
//  Created by Dmitry Rybochkin on 16/04/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Quick
import Nimble
import TuringSafeDictionary

final class TestTuringSafeDictionarySelectingSpec: QuickSpec {

    // MARK: - Types

    typealias SafeDictionary = TuringSafeDictionary<String, Int>

    // MARK: - Life cycle

    //swiftlint:disable:next function_body_length
    override func spec() {
        describe("these will success") {
            //swiftlint:disable:next line_length
            it("test func filter(_ isIncluded: (Element) throws -> Bool) rethrows -> TuringSafeDictionary<Key, Value>") {
                let testDictionary = ["1": 1, "2": 2, "3": 1, "4": 5, "5": 1, "6": 3]
                let safeDictionary = SafeDictionary(dictionary: testDictionary)
                let filteredSafeDictionary: SafeDictionary = safeDictionary.filter({ $0.value > 2 })
                let filteredDictionary = testDictionary.filter({ $0.value > 2 })
                expect(filteredSafeDictionary == filteredDictionary) == true
            }
            it("test func prefix(_ maxLength: Int) -> TuringSafeDictionary<Key, Value>") {
                let testDictionary = ["1": 1, "2": 2, "3": 1, "4": 5, "5": 1, "6": 3]
                let safeDictionary = SafeDictionary(dictionary: testDictionary)
                let prefixSafeDictionary: SafeDictionary = safeDictionary.prefix(2)
                let prefixDictionary = SafeDictionary(dictionary: testDictionary.prefix(2))
                expect(prefixSafeDictionary == prefixDictionary) == true
            }
            it("test func prefix(through position: Index) -> TuringSafeDictionary<Key, Value>") {
                let testDictionary = ["1": 1, "2": 2, "3": 1, "4": 5, "5": 1, "6": 3]
                let safeDictionary = SafeDictionary(dictionary: testDictionary)
                let prefixSafeDictionary: SafeDictionary = safeDictionary.prefix(through: safeDictionary.startIndex)
                let startIndex = testDictionary.startIndex
                let prefixDictionary = SafeDictionary(dictionary: testDictionary.prefix(through: startIndex))
                expect(prefixSafeDictionary == prefixDictionary) == true
            }
            it("test func prefix(upTo end: Index) -> TuringSafeDictionary<Key, Value>") {
                let testDictionary = ["1": 1, "2": 2, "3": 1, "4": 5, "5": 1, "6": 3]
                let safeDictionary = SafeDictionary(dictionary: testDictionary)
                let prefixSafeDictionary: SafeDictionary = safeDictionary.prefix(upTo: safeDictionary.endIndex)
                let prefixDictionary = SafeDictionary(dictionary: testDictionary.prefix(upTo: testDictionary.endIndex))
                expect(prefixSafeDictionary == prefixDictionary) == true
            }
            //swiftlint:disable:next line_length
            it("test func prefix(while predicate: (Element) throws -> Bool) rethrows -> TuringSafeDictionary<Key, Value>") {
                let testDictionary = ["1": 1, "2": 2, "3": 1, "4": 5, "5": 1, "6": 3]
                let safeDictionary = SafeDictionary(dictionary: testDictionary)
                let prefixSafeDictionary: SafeDictionary = safeDictionary.prefix(while: { $0.value > 2 })
                let prefixDictionary = SafeDictionary(dictionary: testDictionary.prefix(while: { $0.value > 2 }))
                expect(prefixSafeDictionary == prefixDictionary) == true
            }
            it("test func suffix(_ maxLength: Int) -> TuringSafeDictionary<Key, Value>") {
                let testDictionary = ["1": 1, "2": 2, "3": 1, "4": 5, "5": 1, "6": 3]
                let safeDictionary = SafeDictionary(dictionary: testDictionary)
                let suffixSafeDictionary: SafeDictionary = safeDictionary.suffix(2)
                let suffixDictionary = SafeDictionary(dictionary: testDictionary.suffix(2))
                expect(suffixSafeDictionary == suffixDictionary) == true
            }
            it("test func suffix(from start: Index) -> TuringSafeDictionary<Key, Value>") {
                let testDictionary = ["1": 1, "2": 2, "3": 1, "4": 5, "5": 1, "6": 3]
                let safeDictionary = SafeDictionary(dictionary: testDictionary)
                let suffixSafeDictionary: SafeDictionary = safeDictionary.suffix(from: safeDictionary.startIndex)
                let startIndex = testDictionary.startIndex
                let suffixDictionary = SafeDictionary(dictionary: testDictionary.suffix(from: startIndex))
                expect(suffixSafeDictionary == suffixDictionary) == true
            }
            it("test func filter(_ isIncluded: (Element) throws -> Bool) rethrows -> [Key: Value]") {
                let testDictionary = ["1": 1, "2": 2, "3": 1, "4": 5, "5": 1, "6": 3]
                let safeDictionary = SafeDictionary(dictionary: testDictionary)
                let filteredSafeDictionary: [String: Int] = safeDictionary.filter({ $0.value > 2 })
                let filteredDictionary = testDictionary.filter({ $0.value > 2 })
                expect(filteredSafeDictionary == filteredDictionary) == true
            }
        }
    }
}
