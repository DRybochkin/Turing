//
//  TestTuringSafeDictionaryIteratingSpec.swift
//  TuringSafe_Tests
//
//  Created by Dmitry Rybochkin on 16/04/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Quick
import Nimble
import TuringSafeDictionary

final class TestTuringSafeDictionaryIteratingSpec: QuickSpec {

    // MARK: - Life cycle

    override func spec() {
        describe("these will success") {
            it("test var underestimatedCount: Int") {
                let testDictionary = ["1": 1, "2": 2, "3": 1, "4": 5, "5": 1, "6": 3]
                let safeDictionary = TuringSafeDictionary<String, Int>(dictionary: testDictionary)
                expect(safeDictionary.underestimatedCount) == 6
            }
            it("test var lazy: LazySequence<DictionaryType>") {
                let testDictionary = ["1": 1, "2": 2, "3": 1, "4": 5, "5": 1, "6": 3]
                let safeDictionary = TuringSafeDictionary<String, Int>(dictionary: testDictionary)
                expect(safeDictionary.lazy.count) == 6
            }
            it("test func forEach(_ body: @escaping (Element) throws -> Void) rethrows") {
                let testDictionary = ["1": 1, "2": 2, "3": 1, "4": 5, "5": 1, "6": 3]
                let safeDictionary = TuringSafeDictionary<String, Int>(dictionary: testDictionary)
                var summ = 0
                safeDictionary.forEach({ summ += ($0.value * 100) })
                expect(summ) == 1300
            }
            it("test func makeIterator() -> DictionaryType.Iterator") {
                let testDictionary = ["1": 1, "2": 2, "3": 1, "4": 5, "5": 1, "6": 3]
                let safeDictionary = TuringSafeDictionary<String, Int>(dictionary: testDictionary)
                var result = safeDictionary.makeIterator()
                while let item = result.next() {
                    expect(safeDictionary.contains(where: { $0.key == item.key && $0.value == item.value })) == true
                }
            }
            it("test func enumerated() -> EnumeratedSequence<DictionaryType>") {
                let testDictionary = ["1": 1, "2": 2, "3": 1, "4": 5, "5": 1, "6": 3]
                let safeDictionary = TuringSafeDictionary<String, Int>(dictionary: testDictionary)
                let result = safeDictionary.enumerated()
                result.forEach({ item in
                    expect(safeDictionary.contains(where: {
                        $0.key == item.element.key && $0.value == item.element.value
                    })) == true
                })
            }
        }
    }
}
