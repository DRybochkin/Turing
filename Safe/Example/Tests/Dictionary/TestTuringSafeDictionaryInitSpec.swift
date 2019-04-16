//
//  TestTuringSafeDictionaryInitSpec.swift
//  TuringSafe_Tests
//
//  Created by Dmitry Rybochkin on 16/04/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Quick
import Nimble
import TuringSafe

final class TestTuringSafeDictionaryInitSpec: QuickSpec {

    // MARK: - Life cycle

    override func spec() {
        describe("these will success") {
            it("can do init literal") {
                let safedictionary: TuringSafeDictionary<String, Int> = ["0": 0, "100": 100, "200": 200]
                expect(safedictionary.count) == 3
                expect(safedictionary.first?.key) == "0"
                expect(safedictionary.first?.value) == 0
                expect(safedictionary["100"]) == 100
            }

            it("can do init from sequense") {
                let safedictionary = TuringSafeDictionary<String, Int>(dictionary: ["0": 0, "100": 100, "200": 200])
                expect(safedictionary.count) == 3
                expect(safedictionary.first?.key) == "0"
                expect(safedictionary.first?.value) == 0
                expect(safedictionary["200"]) == 200
            }
        }
    }
}

