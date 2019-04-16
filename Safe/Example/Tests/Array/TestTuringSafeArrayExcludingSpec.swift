//
//  TestTuringSafeArrayExcludingSpec.swift
//  TuringSafe_Tests
//
//  Created by Dmitry Rybochkin on 16/04/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Quick
import Nimble
import TuringSafe

final class TestTuringSafeArrayExcludingSpec: QuickSpec {

    // MARK: - Life cycle

    override func spec() {
        describe("these will success") {
            it("can do dropFirst") {
                let safeArray: TuringSafeArray<Int> = [1, 2, 1, 5, 1, 3]
                let dropped = safeArray.dropFirst(3)
                expect(dropped == [5, 1, 3]) == true
                expect(safeArray == [1, 2, 1, 5, 1, 3]) == true
            }
            it("can do dropLast") {
                let safeArray: TuringSafeArray<Int> = [1, 2, 1, 5, 1, 3]
                let dropped = safeArray.dropLast(3)
                expect(dropped == [1, 2, 1]) == true
                expect(safeArray == [1, 2, 1, 5, 1, 3]) == true
            }
            it("can do drop while") {
                let safeArray: TuringSafeArray<Int> = [1, 2, 1, 5, 1, 3]
                let dropped = safeArray.drop(while: { $0 < 5 })
                expect(dropped == [5, 1, 3]) == true
                expect(safeArray == [1, 2, 1, 5, 1, 3]) == true
            }
        }
    }
}
