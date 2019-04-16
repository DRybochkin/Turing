//
//  TestTuringSafeDictionaryIteratingSpec.swift
//  TuringSafe_Tests
//
//  Created by Dmitry Rybochkin on 16/04/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Quick
import Nimble
import TuringSafe

final class TestTuringSafeDictionaryIteratingSpec: QuickSpec {

    // MARK: - Life cycle

    override func spec() {
        describe("these will success") {
            it("can do underestimatedCount") {
                let safedictionary: TuringSafeDictionary<Int> = [1, 2, 1, 5, 1, 3]
                expect(safedictionary.underestimatedCount) == 6
            }
            it("can do forEach") {
                let safedictionary: TuringSafeDictionary<Int> = [1, 2, 1, 5, 1, 3]
                var summ = 0
                safedictionary.forEach({ summ += ($0 * 100) })
                expect(summ) == 1300
            }
            it("can do makeIterator") {
                let safedictionary: TuringSafeDictionary<Int> = [1, 2, 1, 5, 1, 3]
                let result = safedictionary.makeIterator()
                expect(result.elementsEqual(safedictionary)) == true
            }
        }
    }
}
