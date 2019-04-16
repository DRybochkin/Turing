//
//  TestTuringSafeArrayTransformingSpec.swift
//  TuringSafe_Tests
//
//  Created by Dmitry Rybochkin on 16/04/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Quick
import Nimble
import TuringSafe

final class TestTuringSafeArrayTransformingSpec: QuickSpec {

    // MARK: - Life cycle

    override func spec() {
        describe("these will success") {
            it("can do lazy") {
                let safeArray: TuringSafeArray<Int> = [1, 2, 1, 5, 1, 3]
                expect(safeArray.lazy.elements == [1, 2, 1, 5, 1, 3]) == true
            }
            it("can do map") {
                let safeArray: TuringSafeArray<Int> = [1, 2, 1, 5, 1, 3]
                expect(safeArray.map({ $0 + 10 }) == [11, 12, 11, 15, 11, 13]) == true
            }
            it("can do compactMap") {
                let safeArray: TuringSafeArray<Int> = [1, 2, 1, 5, 1, 3]
                let result: [Int] = safeArray.compactMap({ $0 + 10 })
                expect(result == [11, 12, 11, 15, 11, 13]) == true
                let safeResult: TuringSafeArray<Int> = safeArray.compactMap({ $0 + 10 })
                expect(safeResult == [11, 12, 11, 15, 11, 13]) == true
            }
            it("can do reduce nextPartialResult") {
                let safeArray: TuringSafeArray<Int> = [1, 2, 1, 5, 1, 3]
                expect(safeArray.reduce(0, +)) == 13
            }
            it("can do reduce updateAccumulatingResult") {
                let safeArray: TuringSafeArray<Int> = [1, 2, 1, 5, 1, 3]
                expect(safeArray.reduce(0, { $0 + $1 })) == 13
            }
        }
    }
}
