//
//  TestTuringSafeArrayInspectingSpec.swift
//  TuringSafe_Tests
//
//  Created by Dmitry Rybochkin on 16/04/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Quick
import Nimble
import TuringSafe

final class TestTuringSafeArrayInspectingSpec: QuickSpec {

    // MARK: - Life cycle

    override func spec() {
        describe("these will success") {
            it("can do count") {
                let safeArray: TuringSafeArray<Int> = [0, 100, 200]
                expect(safeArray.count) == 3
            }
            it("can do isEmpty") {
                var safeArray = TuringSafeArray<Int>()
                expect(safeArray.isEmpty) == true
                safeArray = [0, 100, 200]
                expect(safeArray.isEmpty) == false
                safeArray.removeAll()
                expect(safeArray.isEmpty) == true
            }
            it("can do capacity") {
                let safeArray: TuringSafeArray<Int> = [0, 100, 200]
                expect(safeArray.capacity) >= 3
            }
        }
    }
}
