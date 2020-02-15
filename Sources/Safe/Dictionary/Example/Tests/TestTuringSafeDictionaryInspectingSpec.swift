//
//  TestTuringSafeDictionaryInspectingSpec.swift
//  TuringSafe_Tests
//
//  Created by Dmitry Rybochkin on 16/04/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Quick
import Nimble
import TuringSafeDictionary

final class TestTuringSafeDictionaryInspectingSpec: QuickSpec {

    // MARK: - Life cycle

    override func spec() {
        describe("these will success") {
            it("test var isEmpty: Bool") {
                var safeDictionary: TuringSafeDictionary<String, Int> = [:]
                expect(safeDictionary.isEmpty) == true
                safeDictionary = ["1": 0, "2": 100, "3": 200]
                expect(safeDictionary.isEmpty) == false
                safeDictionary.removeAll()
                expect(safeDictionary.isEmpty) == true
            }
            it("test var count: Int") {
                var safeDictionary: TuringSafeDictionary<String, Int> = [:]
                expect(safeDictionary.count) == 0
                safeDictionary = ["1": 0, "2": 100, "3": 200]
                expect(safeDictionary.count) == 3
                safeDictionary.removeAll()
                expect(safeDictionary.count) == 0
            }
            it("test var capacity: Int") {
                let safeDictionary: TuringSafeDictionary<String, Int> = ["1": 1, "2": 2, "3": 1, "4": 5, "5": 1, "6": 3]
                expect(safeDictionary.capacity) >= 6
            }
        }
    }
}
