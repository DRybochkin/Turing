//
//  TestTuringSafeArrayHasherSpec.swift
//  TuringSafe_Tests
//
//  Created by Dmitry Rybochkin on 16/04/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Quick
import Nimble
import TuringSafe

final class TestTuringSafeArrayHasherSpec: QuickSpec {

    // MARK: - Life cycle

    override func spec() {
        describe("these will success") {
            it("can do hash equals") {
                let safeArray1: TuringSafeArray<Int> = [1, 2, 1, 5, 1, 3]
                let safeArray2: TuringSafeArray<Int> = [1, 2, 1, 5, 1, 3]
                expect(safeArray1.hashValue) == safeArray2.hashValue
            }
            it("can do hash not equals") {
                let array = [1, 2, 1, 5, 1, 3]
                let safeArray: TuringSafeArray<Int> = [1, 2, 1, 5, 1, 3]
                expect(safeArray.hashValue) != array.hashValue
            }
        }
    }
}
