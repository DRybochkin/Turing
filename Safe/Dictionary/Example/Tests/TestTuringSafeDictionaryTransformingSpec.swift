//
//  TestTuringSafeDictionaryTransformingSpec.swift
//  TuringSafe_Tests
//
//  Created by Dmitry Rybochkin on 16/04/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Quick
import Nimble
import TuringSafeDictionary

final class TestTuringSafeDictionaryTransformingSpec: QuickSpec {

    // MARK: - Life cycle

    override func spec() {
        describe("these will success") {
            it("test func mapValues<T>(_ transform: (Value) throws -> T) rethrows -> TuringSafeDictionary<Key, T>") {
                let testDictionary = ["1": 1, "2": 2, "3": 1, "4": 5, "5": 1, "6": 3]
                let safeDictionary = TuringSafeDictionary<String, Int>(dictionary: testDictionary)
                let newSafeDictionary: TuringSafeDictionary<String, String> = safeDictionary.mapValues({ "\($0)" })
                let newTestDictionary: [String: String] = testDictionary.mapValues({ "\($0)" })
                expect(newSafeDictionary == newTestDictionary) == true
            }
            it("test func compactMapValues<T>(_ transform: (Value) throws -> T?) rethrows -> TuringSafeDictionary<Key, T>") {
                let testDictionary = ["1": 1, "2": 2, "3": 1, "4": 5, "5": 1, "6": 3]
                let safeDictionary = TuringSafeDictionary<String, Int>(dictionary: testDictionary)
                let newSafeDictionary: TuringSafeDictionary<String, String> = safeDictionary.compactMapValues({ "\($0)" })
                let newTestDictionary: [String: String] = testDictionary.compactMapValues({ "\($0)" })
                expect(newSafeDictionary == newTestDictionary) == true
            }
            it("test func mapValues<T>(_ transform: (Value) throws -> T) rethrows -> Dictionary<Key, T>") {
                let testDictionary = ["1": 1, "2": 2, "3": 1, "4": 5, "5": 1, "6": 3]
                let safeDictionary = TuringSafeDictionary<String, Int>(dictionary: testDictionary)
                let newDictionary: [String: String] = safeDictionary.mapValues({ "\($0)" })
                let newTestDictionary: [String: String] = testDictionary.mapValues({ "\($0)" })
                expect(newDictionary == newTestDictionary) == true
            }
            it("test func compactMapValues<T>(_ transform: (Value) throws -> T?) rethrows -> Dictionary<Key, T>") {
                let testDictionary = ["1": 1, "2": 2, "3": 1, "4": 5, "5": 1, "6": 3]
                let safeDictionary = TuringSafeDictionary<String, Int>(dictionary: testDictionary)
                let newDictionary: [String: String] = safeDictionary.compactMapValues({ "\($0)" })
                let newTestDictionary: [String: String] = testDictionary.compactMapValues({ "\($0)" })
                expect(newDictionary == newTestDictionary) == true
            }
            it("test func reduce<Result>(_ initialResult: Result, _ nextPartialResult: (Result, Element) throws -> Result) rethrows -> Result") {
                let testDictionary = ["1": 1, "2": 2, "3": 1, "4": 5, "5": 1, "6": 3]
                let safeDictionary = TuringSafeDictionary<String, Int>(dictionary: testDictionary)
                let newPair: (key: String, value: Int) = safeDictionary.reduce((key: "", value: 0), { x, y in
                    (key: x.key + y.key, value: x.value + y.value)
                })
                let newTestPair: (key: String, value: Int) = testDictionary.reduce((key: "", value: 0), { x, y in
                    (key: x.key + y.key, value: x.value + y.value)
                })
                expect(newPair.key == newTestPair.key) == true
                expect(newPair.value == newTestPair.value) == true
            }
            it("test func reduce<Result>(into initialResult: Result, _ updateAccumulatingResult: (inout Result, Element) throws -> ()) rethrows -> Result") {
                let testDictionary = ["1": 1, "2": 2, "3": 1, "4": 5, "5": 1, "6": 3]
                let safeDictionary = TuringSafeDictionary<String, Int>(dictionary: testDictionary)
                let newDictionary: [String: Int] = safeDictionary.reduce(into: [:], { items, item in
                    items[item.key, default: 0] += item.value
                })
                let newTestDictionary: [String: Int] = testDictionary.reduce(into: [:], { items, item in
                    items[item.key, default: 0] += item.value
                })
                expect(newDictionary == newTestDictionary) == true
            }
            it("test func map<T>(_ transform: (Element) throws -> T) rethrows -> [T]") {
                let testDictionary = ["1": 1, "2": 2, "3": 1, "4": 5, "5": 1, "6": 3]
                let safeDictionary = TuringSafeDictionary<String, Int>(dictionary: testDictionary)
                let array = safeDictionary.map({ $0.value })
                let testArray = testDictionary.map({ $0.value })
                expect(array == testArray) == true
            }
            it("test func compactMap<ElementOfResult>(_ transform: (Element) throws -> ElementOfResult?) rethrows -> [ElementOfResult]") {
                let testDictionary = ["1": 1, "2": 2, "3": 1, "4": 5, "5": 1, "6": 3]
                let safeDictionary = TuringSafeDictionary<String, Int>(dictionary: testDictionary)
                let array = safeDictionary.compactMap({ $0.value })
                let testArray = testDictionary.compactMap({ $0.value })
                expect(array == testArray) == true
            }
            it("test func sorted(by areInIncreasingOrder: (Element, Element) throws -> Bool) rethrows -> [Element]") {
                let testDictionary = ["1": 1, "2": 2, "3": 1, "4": 5, "5": 1, "6": 3]
                let safeDictionary = TuringSafeDictionary<String, Int>(dictionary: testDictionary)
                let array: [(String, Int)] = safeDictionary.sorted(by: { item1, item2 in item1.value > item2.value })
                let testArray = testDictionary.sorted(by: { item1, item2 in item1.value > item2.value })
                expect(array.count == testArray.count) == true
            }
        }
    }
}
