//
//  TestTuringSafeDictionaryFindingSpec.swift
//  TuringSafe_Tests
//
//  Created by Dmitry Rybochkin on 16/04/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Quick
import Nimble
import TuringSafeDictionary

final class TestTuringSafeDictionaryFindingSpec: QuickSpec {

    // MARK: - Life cycle

    override func spec() {
        describe("these will success") {
            it("test func contains(where predicate: (Element) throws -> Bool) rethrows -> Bool") {
                let safeDictionary: TuringSafeDictionary<String, Int> = ["1": 1, "2": 2, "3": 1, "4": 5, "5": 1, "6": 3]
                expect(safeDictionary.contains(where: { $0.key == "1" })) == true
                expect(safeDictionary.contains(where: { $0.value == 5 })) == true
                expect(safeDictionary.contains(where: { $0.key == "6" && $0.value == 3 })) == true
                expect(safeDictionary.contains(where: { $0.key == "2" && $0.value == 3 })) == false
                expect(safeDictionary.contains(where: { $0.key == "" })) == false
                expect(safeDictionary.contains(where: { $0.value < 0 })) == false
            }
            it("test func allSatisfy(_ predicate: (Element) throws -> Bool) rethrows -> Bool") {
                let safeDictionary: TuringSafeDictionary<String, Int> = ["1": 1, "2": 2, "3": 1, "4": 5, "5": 1, "6": 3]
                expect(safeDictionary.allSatisfy({ $0.value > 0 })) == true
                expect(safeDictionary.allSatisfy({ $0.value > 1 })) == false
            }
            it("test func first(where predicate: (Element) throws -> Bool) rethrows -> Element?") {
                let safeDictionary: TuringSafeDictionary<String, Int> = ["1": 1, "2": 2, "3": 3, "4": 4, "5": 5, "6": 6]
                expect(safeDictionary.first(where: { $0.value > 5 })?.key) == "6"
                expect(safeDictionary.first(where: { $0.value > 5 })?.value) == 6
                expect(safeDictionary.first(where: { $0.value <= 1 })?.key) == "1"
                expect(safeDictionary.first(where: { $0.value <= 1 })?.value) == 1
                expect(safeDictionary.first(where: { $0.value >= 20 })).to(beNil())
            }
            it("test func firstIndex(where predicate: (Element) throws -> Bool) rethrows -> Index?") {
                let safeDictionary: TuringSafeDictionary<String, Int> = ["1": 1, "2": 2, "3": 1, "4": 5, "5": 1, "6": 3]
                expect(safeDictionary.firstIndex(where: { $0.value > 2 })).notTo(beNil())
                expect(safeDictionary.firstIndex(where: { $0.value > 20 })).to(beNil())
            }
            it("test func min(by areInIncreasingOrder: (Element, Element) throws -> Bool) rethrows -> Element?") {
                let safeDictionary: TuringSafeDictionary<String, Int> = ["1": 1, "2": 2, "3": 1, "4": 5, "5": 1, "6": 3]
                expect(safeDictionary.min(by: { $0.value > $1.value })?.value) == 5
                expect(safeDictionary.min(by: { $0.value > $1.value })?.key) == "4"
            }
            it("test func max(by areInIncreasingOrder: (Element, Element) throws -> Bool) rethrows -> Element?") {
                let safeDictionary: TuringSafeDictionary<String, Int> = ["1": 1, "2": 2, "3": 1, "4": 5, "5": 1, "6": 3]
                expect(safeDictionary.max(by: { $0.value < $1.value })?.value) == 5
                expect(safeDictionary.max(by: { $0.value < $1.value })?.key) == "4"
            }
        }
    }
}

