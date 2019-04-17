//
//  TestTuringSafeDictionaryInitSpec.swift
//  TuringSafe_Tests
//
//  Created by Dmitry Rybochkin on 16/04/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Quick
import Nimble
import TuringSafeDictionary

final class TestTuringSafeDictionaryInitSpec: QuickSpec {

    // MARK: - Life cycle

    override func spec() {
        describe("these will success") {
            it("test init()") {
                let safeDictionary = TuringSafeDictionary<String, Int>()
                expect(safeDictionary.count) == 0
            }
            it("test init(isConcurrent: Bool)") {
                let safeDictionary = TuringSafeDictionary<String, Int>(isConcurrent: true)
                expect(safeDictionary.count) == 0
            }
            it("test init(dictionary elements: DictionaryType)") {
                let dictionary = ["0": 0, "100": 100, "200": 200]
                let safeDictionary = TuringSafeDictionary<String, Int>(dictionary: dictionary)
                expect(safeDictionary == dictionary) == true
            }
            it("test init(dictionary elements: Slice<DictionaryType>)") {
                let dictionary: Slice<Dictionary<String,Int>> = ["0": 0, "100": 100, "200": 200].dropFirst()
                let safeDictionary = TuringSafeDictionary<String, Int>(dictionary: dictionary)
                var testDictionary = Dictionary<String, Int>()
                dictionary.forEach({ testDictionary[$0.key] = $0.value })
                expect(safeDictionary == testDictionary) == true
            }
            it("test init(dictionary elements: [Element])") {
                let dictionary: [String: Int] = ["0": 0, "100": 100, "200": 200]
                let safeDictionary = TuringSafeDictionary<String, Int>(dictionary: dictionary)
                expect(safeDictionary == dictionary) == true
            }
            it("test init(dictionaryLiteral elements: (Key, Value)...)") {
                let safedictionary: TuringSafeDictionary<String, Int> = ["0": 0, "100": 100, "200": 200]
                expect(safedictionary == ["0": 0, "100": 100, "200": 200]) == true
            }
            it("test init(minimumCapacity: Int)") {
                let safeDictionary = TuringSafeDictionary<String, Int>(minimumCapacity: 100)
                expect(safeDictionary.capacity) >= 100
            }
            it("test init<S>(uniqueKeysWithValues keysAndValues: S) where S: Sequence, S.Element == (Key, Value)") {
                let array = ["0", "100", "200"]
                let safeDictionary = TuringSafeDictionary<String, Int>(uniqueKeysWithValues: zip(array, [0, 100, 200]))
                let testDictionary = Dictionary<String, Int>(uniqueKeysWithValues: zip(array, [0, 100, 200]))
                expect(safeDictionary == testDictionary) == true
            }
            it("test init<S>(_ keysAndValues: S, uniquingKeysWith combine: (Value, Value) throws -> Value) rethrows where S: Sequence, S.Element == (Key, Value)") {
                let dictionary = [("0", 0), ("100", 100), ("200", 200), ("100", 300)]
                let safeDictionary = TuringSafeDictionary<String, Int>(dictionary, uniquingKeysWith: { first, second in
                    second
                })
                let testDictionary = Dictionary<String, Int>(dictionary, uniquingKeysWith: { first, second in
                    second
                })
                expect(safeDictionary == testDictionary) == true
            }
            it("test init<S>(grouping values: S, by keyForValue: (S.Element) throws -> Key) rethrows where Value == [S.Element], S: Sequence") {
                let array = ["0", "10", "100", "30", "340"]
                let safeDictionary = TuringSafeDictionary(grouping: array, by: { $0.first! })
                let testDictionary = Dictionary(grouping: array, by: { $0.first! })
                expect(safeDictionary == testDictionary) == true
            }
        }
    }
}

