//
//  TestTuringSafeDictionaryRemovingSpec.swift
//  TuringSafe_Tests
//
//  Created by Dmitry Rybochkin on 16/04/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Quick
import Nimble
import TuringSafeDictionary

final class TestTuringSafeDictionaryRemovingSpec: QuickSpec {

    // MARK: - Life cycle

    //swiftlint:disable:next function_body_length
    override func spec() {
        describe("these will success") {
            it("test func removeValue(forKey key: Key) -> Value?") {
                let safeDictionary: TuringSafeDictionary<String, Int> = ["1": 1, "2": 2, "3": 1, "4": 5, "5": 1, "6": 3]
                expect(safeDictionary["3"]) == 1
                safeDictionary.removeValue(forKey: "3")
                expect(safeDictionary["3"]).to(beNil())
            }
            it("test func remove(at index: Index) -> Element") {
                let safeDictionary: TuringSafeDictionary<String, Int> = ["1": 1, "2": 2, "3": 1, "4": 5, "5": 1, "6": 3]
                let firstItem = safeDictionary[safeDictionary.startIndex]
                let removedItem = safeDictionary.remove(at: safeDictionary.startIndex)
                expect(removedItem.key) == firstItem.key
                expect(removedItem.value) == firstItem.value
                let newFirstItem = safeDictionary[safeDictionary.startIndex]
                expect(removedItem.key) != newFirstItem.key
                expect(removedItem.value) != newFirstItem.value
            }
            it("test func removeAll(keepingCapacity keepCapacity: Bool)") {
                var safeDictionary: TuringSafeDictionary<String, Int> = ["1": 1, "2": 2, "3": 1, "4": 5, "5": 1, "6": 3]
                var capacity = safeDictionary.capacity
                safeDictionary.removeAll(keepingCapacity: true)
                expect(safeDictionary.capacity) == capacity
                expect(safeDictionary.isEmpty) == true
                expect(safeDictionary.count) == 0

                safeDictionary = ["1": 1, "2": 2, "3": 1, "4": 5, "5": 1, "6": 3]
                capacity = safeDictionary.capacity
                safeDictionary.removeAll(keepingCapacity: false)
                expect(safeDictionary.capacity) == 0
                expect(safeDictionary.isEmpty) == true
                expect(safeDictionary.count) == 0
            }
            it("test func removeAll()") {
                let safeDictionary: TuringSafeDictionary<String, Int> = ["1": 1, "2": 2, "3": 1, "4": 5, "5": 1, "6": 3]
                safeDictionary.removeAll()
                expect(safeDictionary.isEmpty) == true
                expect(safeDictionary.count) == 0
            }
            it("test func popFirst() -> Element?") {
                var testDictionary = ["1": 1, "2": 2, "3": 1, "4": 5, "5": 1, "6": 3]
                let safeDictionary = TuringSafeDictionary<String, Int>(dictionary: testDictionary)
                let testItem = testDictionary.popFirst()
                let safeItem = safeDictionary.popFirst()
                expect(safeItem?.key) == testItem?.key
                expect(safeItem?.value) == testItem?.value
                expect(safeDictionary == testDictionary) == true
            }
       }
    }
}
