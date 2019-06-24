//
//  TestTuringSafeDictionaryAddingSpec.swift
//  TuringSafe_Tests
//
//  Created by Dmitry Rybochkin on 16/04/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Quick
import Nimble
import TuringSafeDictionary

final class TestTuringSafeDictionaryAddingSpec: QuickSpec {

    // MARK: - Types

    typealias SafeDictionary = TuringSafeDictionary<String, Int>

    // MARK: - Life cycle

    //swiftlint:disable:next function_body_length
    override func spec() {
        describe("these will success") {
            //swiftlint:disable:next line_length
            it("test func merge(_ other: TuringSafeDictionary<Key, Value>, uniquingKeysWith combine: @escaping (Value, Value) throws -> Value) rethrows") {
                var testDictionary = ["1": 1, "2": 2, "3": 1, "4": 5, "5": 1, "6": 3]
                let mergeTestDictionary = ["4": 3, "3": 4]
                let safeDictionary = SafeDictionary(dictionary: testDictionary)
                let mergeSafeDictionary = SafeDictionary(dictionary: mergeTestDictionary)
                safeDictionary.merge(mergeSafeDictionary, uniquingKeysWith: { current, _ in current })
                testDictionary.merge(mergeTestDictionary, uniquingKeysWith: { current, _ in current })
                expect(safeDictionary == testDictionary) == true
            }
            //swiftlint:disable:next line_length
            it("test func merging(_ other: TuringSafeDictionary<Key, Value>, uniquingKeysWith combine: (Value, Value) throws -> Value) rethrows -> TuringSafeDictionary<Key, Value>") {
                let testDictionary = ["1": 1, "2": 2, "3": 1, "4": 5, "5": 1, "6": 3]
                let mergeTestDictionary = ["4": 3, "3": 4]
                let safeDictionary = SafeDictionary(dictionary: testDictionary)
                let mergeSafeDictionary = SafeDictionary(dictionary: mergeTestDictionary)
                let newSafeDictionary: SafeDictionary
                newSafeDictionary = safeDictionary.merging(mergeSafeDictionary, uniquingKeysWith: { current, _ in
                    current
                })
                let newTestDictionary = testDictionary.merging(mergeTestDictionary, uniquingKeysWith: { current, _ in
                    current
                })
                expect(newSafeDictionary == newTestDictionary) == true
            }
            //swiftlint:disable:next line_length
            it("test func merging<S>(_ other: S, uniquingKeysWith combine: (Value, Value) throws -> Value) rethrows -> TuringSafeDictionary<Key, Value> where S: Sequence, S.Element == (Key, Value)") {
                let testDictionary = ["1": 1, "2": 2, "3": 1, "4": 5, "5": 1, "6": 3]
                let sequence = zip(["4", "3"], [3, 4])
                let safeDictionary = SafeDictionary(dictionary: testDictionary)
                let newSafeDictionary: SafeDictionary = safeDictionary.merging(sequence, uniquingKeysWith: { cur, _ in
                    cur
                })
                let newTestDictionary = testDictionary.merging(sequence, uniquingKeysWith: { cur, _ in
                    cur
                })
                expect(newSafeDictionary == newTestDictionary) == true
            }
            //swiftlint:disable:next line_length
            it("test func merging(_ other: [Key: Value], uniquingKeysWith combine: (Value, Value) throws -> Value) rethrows -> TuringSafeDictionary<Key, Value>") {
                let testDictionary = ["1": 1, "2": 2, "3": 1, "4": 5, "5": 1, "6": 3]
                let mergeDictionary = ["4": 3, "3": 4]
                let safeDictionary = SafeDictionary(dictionary: testDictionary)
                let newSafeDictionary: SafeDictionary
                newSafeDictionary = safeDictionary.merging(mergeDictionary, uniquingKeysWith: { cur, _ in
                    cur
                })
                let newTestDictionary = testDictionary.merging(mergeDictionary, uniquingKeysWith: { cur, _ in
                    cur
                })
                expect(newSafeDictionary == newTestDictionary) == true
            }
            it("test func updateValue(_ value: Value, forKey key: Key) -> Value?") {
                let safeDictionary: SafeDictionary = ["1": 1, "2": 2, "3": 1, "4": 5, "5": 1, "6": 3]
                expect(safeDictionary["3"]) == 1
                safeDictionary.updateValue(44, forKey: "3")
                expect(safeDictionary["3"]) == 44
                expect(safeDictionary["3"]) != 1
            }
            //swiftlint:disable:next line_length
            it("test func merge(_ other: [Key: Value], uniquingKeysWith combine: @escaping (Value, Value) throws -> Value) rethrows") {
                var testDictionary = ["1": 1, "2": 2, "3": 1, "4": 5, "5": 1, "6": 3]
                let safeDictionary: SafeDictionary = ["1": 1, "2": 2, "3": 1, "4": 5, "5": 1, "6": 3]
                let mergeDictionary = ["4": 3, "3": 4]
                testDictionary.merge(mergeDictionary, uniquingKeysWith: { current, _ in current })
                safeDictionary.merge(mergeDictionary, uniquingKeysWith: { current, _ in current })
                expect(safeDictionary == testDictionary) == true
            }
            //swiftlint:disable:next line_length
            it("test func merge<S>(_ other: S, uniquingKeysWith combine: @escaping (Value, Value) throws -> Value) rethrows where S: Sequence, S.Element == (Key, Value)") {
                var testDictionary = ["1": 1, "2": 2, "3": 1, "4": 5, "5": 1, "6": 3]
                let safeDictionary: SafeDictionary = ["1": 1, "2": 2, "3": 1, "4": 5, "5": 1, "6": 3]
                let sequence = zip(["4", "3"], [3, 4])
                testDictionary.merge(sequence, uniquingKeysWith: { _, new in new })
                safeDictionary.merge(sequence, uniquingKeysWith: { _, new in new })
                expect(safeDictionary == testDictionary) == true
            }
            //swiftlint:disable:next line_length
            it("test func merging(_ other: [Key: Value], uniquingKeysWith combine: (Value, Value) throws -> Value) rethrows -> [Key: Value]") {
                let testDictionary = ["1": 1, "2": 2, "3": 1, "4": 5, "5": 1, "6": 3]
                let mergeDictionary: [String: Int] = ["4": 3, "3": 4]
                let safeDictionary = SafeDictionary(dictionary: testDictionary)
                let newDictionary: [String: Int] = safeDictionary.merging(mergeDictionary, uniquingKeysWith: { cur, _ in
                    cur
                })
                let newTestDictionary = testDictionary.merging(mergeDictionary, uniquingKeysWith: { cur, _ in
                    cur
                })
                expect(newDictionary == newTestDictionary) == true
            }
            //swiftlint:disable:next line_length
            it("test func merging<S>(_ other: S, uniquingKeysWith combine: (Value, Value) throws -> Value) rethrows -> [Key: Value] where S: Sequence, S.Element == (Key, Value)") {
                let testDictionary = ["1": 1, "2": 2, "3": 1, "4": 5, "5": 1, "6": 3]
                let sequence = zip(["4", "3"], [3, 4])
                let safeDictionary = SafeDictionary(dictionary: testDictionary)
                let newDictionary: [String: Int] = safeDictionary.merging(sequence, uniquingKeysWith: { current, _ in
                    current
                })
                let newTestDictionary = testDictionary.merging(sequence, uniquingKeysWith: { current, _ in current })
                expect(newDictionary == newTestDictionary) == true
            }
            it("test func reserveCapacity(_ count: Int)") {
                let safeDictionary: SafeDictionary = ["1": 1, "2": 2, "3": 1, "4": 5, "5": 1, "6": 3]
                safeDictionary.reserveCapacity(100)
                expect(safeDictionary.capacity) >= 100
            }
        }
    }
}
