//
//  TestTuringSafeDictionaryAccessingSpec.swift
//  TuringSafe_Tests
//
//  Created by Dmitry Rybochkin on 16/04/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Quick
import Nimble
import TuringSafeDictionary

final class TestTuringSafeDictionaryAccessingSpec: QuickSpec {

    // MARK: - Life cycle

    override func spec() {
        describe("these will success") {
            it("test subscript(key: Key) -> Value?") {
                let safeDictionary: TuringSafeDictionary<String, Int> = ["1": 1, "2": 2, "3": 1, "4": 5, "5": 1, "6": 3]
                expect(safeDictionary["1"]) == 1
                expect(safeDictionary["2"]) == 2
                expect(safeDictionary["3"]) == 1
                expect(safeDictionary["4"]) == 5
                expect(safeDictionary["5"]) == 1
                expect(safeDictionary["6"]) == 3
            }
            it("test subscript(key: Key, default defaultValue: @autoclosure () -> Value) -> Value") {
                let safeDictionary: TuringSafeDictionary<String, Int> = ["1": 1, "2": 2, "3": 1, "4": 5, "5": 1, "6": 3]
                expect(safeDictionary["1", default: 10]) == 1
                expect(safeDictionary["2", default: 10]) == 2
                expect(safeDictionary["3", default: 10]) == 1
                expect(safeDictionary["4", default: 10]) == 5
                expect(safeDictionary["5", default: 10]) == 1
                expect(safeDictionary["6", default: 10]) == 3
                expect(safeDictionary["6", default: 10]) == 3
                expect(safeDictionary["7", default: 10]) == 10
            }
            it("test var keys: DictionaryType.Keys") {
                let safeDictionary: TuringSafeDictionary<String, Int> = ["1": 1, "2": 2, "3": 1, "4": 5, "5": 1, "6": 3]
                let testDictionary: Dictionary<String, Int> = ["1": 1, "2": 2, "3": 1, "4": 5, "5": 1, "6": 3]
                expect(safeDictionary.keys == testDictionary.keys) == true
            }
            it("test var values: DictionaryType.Values") {
                let testDictionary: Dictionary<String, Int> = ["1": 1, "2": 2, "3": 1, "4": 5, "5": 1, "6": 3]
                let safeDictionary = TuringSafeDictionary<String, Int>(dictionary: testDictionary)
                expect(safeDictionary.values.compactMap({ $0 }) == testDictionary.values.compactMap({ $0 })) == true
            }
            it("test var first: Element?") {
                let testDictionary: Dictionary<String, Int> = ["1": 1, "2": 2, "3": 1, "4": 5, "5": 1, "6": 3]
                let safeDictionary = TuringSafeDictionary<String, Int>(dictionary: testDictionary)
                expect(safeDictionary.first?.key == testDictionary.first?.key) == true
                expect(safeDictionary.first?.value == testDictionary.first?.value) == true
            }
            it("test func index(forKey key: Key) -> Index?") {
                let safeDictionary: TuringSafeDictionary<String, Int> = ["1": 1, "2": 2, "3": 1, "4": 5, "5": 1, "6": 3]
                expect(safeDictionary.index(forKey: "3") == safeDictionary.index(forKey: "3")) == true
                expect(safeDictionary.index(forKey: "3") == safeDictionary.index(forKey: "4")) != true
            }
            it("test subscript(position: Index) -> Iterator.Element") {
                let testDictionary: Dictionary<String, Int> = ["1": 1, "2": 2, "3": 1, "4": 5, "5": 1, "6": 3]
                let safeDictionary = TuringSafeDictionary<String, Int>(dictionary: testDictionary)
                expect(safeDictionary[safeDictionary.startIndex] == testDictionary[testDictionary.startIndex]) == true
                expect(safeDictionary[safeDictionary.startIndex] == testDictionary[testDictionary.index(testDictionary.startIndex, offsetBy: 2)]) == false
            }
            it("test subscript(bounds: Range<Index>) -> SubSequence") {
                let testDictionary: Dictionary<String, Int> = ["1": 1, "2": 2, "3": 1, "4": 5, "5": 1, "6": 3]
                let safeDictionary = TuringSafeDictionary<String, Int>(dictionary: testDictionary)
                guard let safeStartIndex = safeDictionary.index(forKey: "2"), let safeEndIndex = safeDictionary.index(forKey: "5") else {
                    expect(1) == 0
                    return
                }
                guard let testStartIndex = testDictionary.index(forKey: "2"), let testEndIndex = testDictionary.index(forKey: "5") else {
                    expect(1) == 0
                    return
                }
                let newSliceSafeDictionary = safeDictionary[min(safeStartIndex, safeEndIndex)..<max(safeStartIndex, safeEndIndex)]
                let newSliceTestDictionary = testDictionary[min(testStartIndex, testEndIndex)..<max(testStartIndex, testEndIndex)]
                let newSafeDictionary = TuringSafeDictionary(dictionary: newSliceSafeDictionary)
                var newTestDictionary: [String: Int] = [:]
                newSliceTestDictionary.forEach({ newTestDictionary[$0.key] = $0.value })
                expect(newSafeDictionary == newTestDictionary) == true
            }
            it("test func randomElement() -> Element?") {
                let safeDictionary: TuringSafeDictionary<String, Int> = ["1": 1, "2": 2, "3": 1, "4": 5, "5": 1, "6": 3]
                if let item = safeDictionary.randomElement() {
                    expect(safeDictionary.contains(where: { $0.key == item.key && $0.value == item.value })) == true
                } else {
                    expect(1) == 0
                }
            }
        }
    }
}

