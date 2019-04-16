//
//  TestTuringSafeDictionaryInspectingSpec.swift
//  TuringSafe_Tests
//
//  Created by Dmitry Rybochkin on 16/04/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Quick
import Nimble
import TuringSafe

final class TestTuringSafeDictionaryInspectingSpec: QuickSpec {

    // MARK: - Life cycle

    override func spec() {
        describe("these will success") {
            it("can do count") {
                let safedictionary: TuringSafeDictionary<Int> = [0, 100, 200]
                expect(safedictionary.count) == 3
            }
            it("can do isEmpty") {
                var safedictionary = TuringSafeDictionary<Int>()
                expect(safedictionary.isEmpty) == true
                safedictionary = [0, 100, 200]
                expect(safedictionary.isEmpty) == false
                safedictionary.removeAll()
                expect(safedictionary.isEmpty) == true
            }
            it("can do capacity") {
                let safedictionary: TuringSafeDictionary<Int> = [0, 100, 200]
                expect(safedictionary.capacity) >= 3
            }
        }
    }
}
