//
//  TestTuringSafeArrayReorderingSpec.swift
//  TuringSafe_Tests
//
//  Created by Dmitry Rybochkin on 16/04/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Quick
import Nimble
import TuringSafe

final class TestTuringSafeArrayReorderingSpec: QuickSpec {

    // MARK: - Life cycle

    override func spec() {
        describe("these will success") {
            it("can do sort") {
                let safeArray: TuringSafeArray<Int> = [1, 2, 1, 5, 1, 3]
                safeArray.sort()
                expect(safeArray == [1, 1, 1, 2, 3, 5]) == true
            }
            it("can do sorted") {
                let safeArray: TuringSafeArray<Int> = [1, 2, 1, 5, 1, 3]
                let sorted = safeArray.sorted()
                expect(sorted == [1, 1, 1, 2, 3, 5]) == true
            }
            it("can do sort areInIncreasingOrder") {
                let safeArray: TuringSafeArray<Int> = [1, 2, 1, 5, 1, 3]
                safeArray.sort(by: { $0 > $1 })
                expect(safeArray == [5, 3, 2, 1, 1, 1]) == true
            }
            it("can do sorted areInIncreasingOrder") {
                let safeArray: TuringSafeArray<Int> = [1, 2, 1, 5, 1, 3]
                let sorted = safeArray.sorted(by: { $0 > $1 })
                expect(sorted == [5, 3, 2, 1, 1, 1]) == true
            }
            it("can do reverse") {
                let safeArray: TuringSafeArray<Int> = [1, 2, 1, 5, 1, 3]
                safeArray.reverse()
                expect(safeArray == [3, 1, 5, 1, 2, 1]) == true
            }
            it("can do swap") {
                let safeArray: TuringSafeArray<Int> = [1, 2, 1, 5, 1, 3]
                safeArray.swapAt(1, 4)
                expect(safeArray == [1, 1, 1, 5, 2, 3]) == true
            }
        }
    }
}
