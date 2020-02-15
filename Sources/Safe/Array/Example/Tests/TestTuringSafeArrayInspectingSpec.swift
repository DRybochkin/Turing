//
//  TestTuringSafeArrayInspectingSpec.swift
//  TuringSafe_Tests
//
//  Created by Dmitry Rybochkin on 16/04/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Quick
import Nimble
import TuringSafeArray

final class TestTuringSafeArrayInspectingSpec: QuickSpec {

    // MARK: - Life cycle

    override func spec() {
        describe("these will success") {
            it("test var count: Int") {
                let safeArray: TuringSafeArray<Int> = [0, 100, 200]
                expect(safeArray.count) == 3
            }
            it("test var isEmpty: Bool") {
                var safeArray = TuringSafeArray<Int>()
                expect(safeArray.isEmpty) == true
                safeArray = [0, 100, 200]
                expect(safeArray.isEmpty) == false
                safeArray.removeAll()
                expect(safeArray.isEmpty) == true
            }
            it("test var capacity: Int") {
                let safeArray: TuringSafeArray<Int> = [0, 100, 200]
                expect(safeArray.capacity) >= 3
            }
        }
    }
}
