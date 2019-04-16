//
//  TestTuringSafeArrayInitSpec.swift
//  TuringSafe_Tests
//
//  Created by Dmitry Rybochkin on 16/04/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Quick
import Nimble
import TuringSafe

final class TestTuringSafeArrayInitSpec: QuickSpec {

    // MARK: - Life cycle

    override func spec() {
        describe("these will success") {
            it("can do init literal") {
                let safeArray: TuringSafeArray<Int> = [0, 100, 200]
                expect(safeArray.count) == 3
                expect(safeArray.first) == 0
                expect(safeArray.last) == 200
                expect(safeArray[1]) == 100
            }

            it("can do init from sequense") {
                let safeArray = TuringSafeArray<Int>([0, 100, 200])
                expect(safeArray.count) == 3
                expect(safeArray.first) == 0
                expect(safeArray.last) == 200
                expect(safeArray[1]) == 100
            }

            it("can do init with repeating") {
                let safeArray = TuringSafeArray<Int>(repeating: 2, count: 3)
                expect(safeArray.count) == 3
                expect(safeArray.first) == 2
                expect(safeArray.last) == 2
                expect(safeArray[1]) == 2
            }
        }
    }
}

