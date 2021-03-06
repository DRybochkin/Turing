//
//  TestTuringSafeArrayComparingSpec.swift
//  TuringSafe_Tests
//
//  Created by Dmitry Rybochkin on 16/04/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Quick
import Nimble
import TuringSafeArray

final class TestTuringSafeArrayComparingSpec: QuickSpec {

    // MARK: - Life cycle

    override func spec() {
        describe("these will success") {
            it("test func ==(lhs: TuringSafeArray<Element>, rhs: TuringSafeArray<Element>) -> Bool") {
                let safeArray1: TuringSafeArray<Int> = [1, 2, 1, 5, 1, 3]
                let safeArray2: TuringSafeArray<Int> = [1, 2, 1, 5, 1, 3]
                expect(safeArray1 == safeArray2) == true
                let safeArray3: TuringSafeArray<Int> = [1, 2]
                expect(safeArray1 == safeArray3) == false
            }
            it("test func !=(lhs: TuringSafeArray<Element>, rhs: TuringSafeArray<Element>) -> Bool") {
                let safeArray1: TuringSafeArray<Int> = [1, 2, 1, 5, 1, 3]
                let safeArray2: TuringSafeArray<Int> = [1, 2, 1, 5, 1, 3]
                expect(safeArray1 != safeArray2) == false
                let safeArray3: TuringSafeArray<Int> = [1, 2]
                expect(safeArray1 != safeArray3) == true
            }
        }
    }
}
