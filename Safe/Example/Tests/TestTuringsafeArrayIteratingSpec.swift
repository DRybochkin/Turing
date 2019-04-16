//
//  TestTuringsafeArrayIteratingSpec.swift
//  TuringSafe_Tests
//
//  Created by Dmitry Rybochkin on 16/04/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Quick
import Nimble
import TuringSafe

final class TestTuringsafeArrayIteratingSpec: QuickSpec {

    // MARK: - Life cycle

    override func spec() {
        describe("these will success") {
            it("can do underestimatedCount") {
                let safeArray: TuringSafeArray<Int> = [1, 2, 1, 5, 1, 3]
                expect(safeArray.underestimatedCount) == 6
            }
            it("can do forEach") {
                let safeArray: TuringSafeArray<Int> = [1, 2, 1, 5, 1, 3]
                var summ = 0
                safeArray.forEach({ summ += ($0 * 100) })
                expect(summ) == 1300
            }
            it("can do makeIterator") {
                let safeArray: TuringSafeArray<Int> = [1, 2, 1, 5, 1, 3]
                let result = safeArray.makeIterator()
                expect(result.elementsEqual(safeArray)) == true
            }
        }
    }
}
