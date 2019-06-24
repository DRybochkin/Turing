//
//  TestTuringSafeDictionaryManipulatingSpec.swift
//  TuringSafe_Tests
//
//  Created by Dmitry Rybochkin on 16/04/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Quick
import Nimble
import TuringSafeDictionary

final class TestTuringSafeDictionaryManipulatingSpec: QuickSpec {

    // MARK: - Life cycle

    //swiftlint:disable:next function_body_length
    override func spec() {
        describe("these will success") {
            it("test var indices: Indices") {
                let safeDictionary: TuringSafeDictionary<String, Int> = ["1": 1, "2": 2, "3": 1, "4": 5, "5": 1, "6": 3]
                expect(safeDictionary.indices.startIndex == safeDictionary.startIndex) == true
                expect(safeDictionary.indices.endIndex == safeDictionary.endIndex) == true
            }
            it("test var startIndex: Index") {
                let safeDictionary: TuringSafeDictionary<String, Int> = ["1": 1, "2": 2, "3": 1, "4": 5, "5": 1, "6": 3]
                expect(safeDictionary.startIndex).notTo(beNil())
            }
            it("test var endIndex: Index") {
                let safeDictionary: TuringSafeDictionary<String, Int> = ["1": 1, "2": 2, "3": 1, "4": 5, "5": 1, "6": 3]
                expect(safeDictionary.endIndex).notTo(beNil())
            }
            it("test func index(after index: Index) -> Index") {
                let safeDictionary: TuringSafeDictionary<String, Int> = ["1": 1, "2": 2, "3": 1, "4": 5, "5": 1, "6": 3]
                let index2 = safeDictionary.index(after: safeDictionary.startIndex)
                let index3 = safeDictionary.index(after: index2)
                expect(safeDictionary.index(after: index2)) == index3
                expect(safeDictionary.startIndex) != index2
                expect(safeDictionary.startIndex) != index3
            }
            it("test func index(_ index: Index, offsetBy: Int) -> Index") {
                let safeDictionary: TuringSafeDictionary<String, Int> = ["1": 1, "2": 2, "3": 1, "4": 5, "5": 1, "6": 3]
                let index2 = safeDictionary.index(after: safeDictionary.startIndex)
                let index3 = safeDictionary.index(after: index2)
                expect(safeDictionary.index(safeDictionary.startIndex, offsetBy: 2)) == index3
            }
            it("test func index(_ index: Index, offsetBy: Int, limitedBy: Index) -> Index? ") {
                let safeDictionary: TuringSafeDictionary<String, Int> = ["1": 1, "2": 2, "3": 1, "4": 5, "5": 1, "6": 3]
                let index2 = safeDictionary.index(after: safeDictionary.startIndex)
                let index3 = safeDictionary.index(after: index2)
                expect(safeDictionary.index(safeDictionary.startIndex,
                                            offsetBy: 2,
                                            limitedBy: safeDictionary.endIndex)) == index3
                expect(safeDictionary.index(safeDictionary.startIndex,
                                            offsetBy: 2,
                                            limitedBy: safeDictionary.startIndex)).to(beNil())
            }
            it("test func formIndex(after index: inout Index)") {
                let safeDictionary: TuringSafeDictionary<String, Int> = ["1": 1, "2": 2, "3": 1, "4": 5, "5": 1, "6": 3]
                var index = safeDictionary.startIndex
                let index2 = safeDictionary.index(after: safeDictionary.startIndex)
                safeDictionary.formIndex(after: &index)
                expect(index) == index2
            }
            it("test func distance(from start: Index, to end: Index) -> Int") {
                let safeDictionary: TuringSafeDictionary<String, Int> = ["1": 1, "2": 2, "3": 1, "4": 5, "5": 1, "6": 3]
                expect(safeDictionary.distance(from: safeDictionary.startIndex, to: safeDictionary.endIndex)) == 6
            }
        }
    }
}
