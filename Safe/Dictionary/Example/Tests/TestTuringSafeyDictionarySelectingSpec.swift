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

    // MARK: - Life cycle

    override func spec() {
        describe("these will success") {
            it("test func filter(_ isIncluded: (Element) throws -> Bool) rethrows -> TuringSafeDictionary<Key, Value>") {
                let testDictionary = ["1": 1, "2": 2, "3": 1, "4": 5, "5": 1, "6": 3]
                let safeDictionary = TuringSafeDictionary<String, Int>(dictionary: testDictionary)
                let filteredSafeDictionary: TuringSafeDictionary<String, Int> = safeDictionary.filter({ $0.value > 2 })
                let filteredDictionary = testDictionary.filter({ $0.value > 2 })
                expect(filteredSafeDictionary == filteredDictionary) == true
            }
            it("test func prefix(_ maxLength: Int) -> TuringSafeDictionary<Key, Value>") {
                let testDictionary = ["1": 1, "2": 2, "3": 1, "4": 5, "5": 1, "6": 3]
                let safeDictionary = TuringSafeDictionary<String, Int>(dictionary: testDictionary)
                let prefixSafeDictionary: TuringSafeDictionary<String, Int> = safeDictionary.prefix(2)
                let prefixDictionary = TuringSafeDictionary<String, Int>(dictionary: testDictionary.prefix(2))
                expect(prefixSafeDictionary == prefixDictionary) == true
            }
            it("test func prefix(through position: Index) -> TuringSafeDictionary<Key, Value>") {
                let testDictionary = ["1": 1, "2": 2, "3": 1, "4": 5, "5": 1, "6": 3]
                let safeDictionary = TuringSafeDictionary<String, Int>(dictionary: testDictionary)
                let prefixSafeDictionary: TuringSafeDictionary<String, Int> = safeDictionary.prefix(through: safeDictionary.startIndex)
                let prefixDictionary = TuringSafeDictionary<String, Int>(dictionary: testDictionary.prefix(through: testDictionary.startIndex))
                expect(prefixSafeDictionary == prefixDictionary) == true
            }
            it("test func prefix(upTo end: Index) -> TuringSafeDictionary<Key, Value>") {
                let testDictionary = ["1": 1, "2": 2, "3": 1, "4": 5, "5": 1, "6": 3]
                let safeDictionary = TuringSafeDictionary<String, Int>(dictionary: testDictionary)
                let prefixSafeDictionary: TuringSafeDictionary<String, Int> = safeDictionary.prefix(upTo: safeDictionary.endIndex)
                let prefixDictionary = TuringSafeDictionary<String, Int>(dictionary: testDictionary.prefix(upTo: testDictionary.endIndex))
                expect(prefixSafeDictionary == prefixDictionary) == true
            }
            it("test func prefix(while predicate: (Element) throws -> Bool) rethrows -> TuringSafeDictionary<Key, Value>") {
                let testDictionary = ["1": 1, "2": 2, "3": 1, "4": 5, "5": 1, "6": 3]
                let safeDictionary = TuringSafeDictionary<String, Int>(dictionary: testDictionary)
                let prefixSafeDictionary: TuringSafeDictionary<String, Int> = safeDictionary.prefix(while: { $0.value > 2 })
                let prefixDictionary = TuringSafeDictionary<String, Int>(dictionary: testDictionary.prefix(while: { $0.value > 2 }))
                expect(prefixSafeDictionary == prefixDictionary) == true
            }
            it("test func suffix(_ maxLength: Int) -> TuringSafeDictionary<Key, Value>") {
                let testDictionary = ["1": 1, "2": 2, "3": 1, "4": 5, "5": 1, "6": 3]
                let safeDictionary = TuringSafeDictionary<String, Int>(dictionary: testDictionary)
                let suffixSafeDictionary: TuringSafeDictionary<String, Int> = safeDictionary.suffix(2)
                let suffixDictionary = TuringSafeDictionary<String, Int>(dictionary: testDictionary.suffix(2))
                expect(suffixSafeDictionary == suffixDictionary) == true
            }
            it("test func suffix(from start: Index) -> TuringSafeDictionary<Key, Value>") {
                let testDictionary = ["1": 1, "2": 2, "3": 1, "4": 5, "5": 1, "6": 3]
                let safeDictionary = TuringSafeDictionary<String, Int>(dictionary: testDictionary)
                let suffixSafeDictionary: TuringSafeDictionary<String, Int> = safeDictionary.suffix(from: safeDictionary.startIndex)
                let suffixDictionary = TuringSafeDictionary<String, Int>(dictionary: testDictionary.suffix(from: testDictionary.startIndex))
                expect(suffixSafeDictionary == suffixDictionary) == true
            }
            it("test func filter(_ isIncluded: (Element) throws -> Bool) rethrows -> [Key: Value]") {
                let testDictionary = ["1": 1, "2": 2, "3": 1, "4": 5, "5": 1, "6": 3]
                let safeDictionary = TuringSafeDictionary<String, Int>(dictionary: testDictionary)
                let filteredSafeDictionary: [String: Int] = safeDictionary.filter({ $0.value > 2 })
                let filteredDictionary = testDictionary.filter({ $0.value > 2 })
                expect(filteredSafeDictionary == filteredDictionary) == true
            }
        }
    }
}

