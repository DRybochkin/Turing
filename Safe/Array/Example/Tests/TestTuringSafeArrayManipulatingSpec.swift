//
//  TestTuringSafeArrayManipulatingSpec.swift
//  TuringSafe_Tests
//
//  Created by Dmitry Rybochkin on 16/04/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Quick
import Nimble
import TuringSafeArray

final class TestTuringSafeArrayManipulatingSpec: QuickSpec {

    // MARK: - Life cycle

    override func spec() {
        describe("these will success") {
            it("test var indices: Indices") {
                let safeArray: TuringSafeArray<Int> = [1, 2, 1, 5, 1, 3]
                expect(safeArray.indices == 0..<6) == true
            }
            it("test var startIndex: Index") {
                let safeArray: TuringSafeArray<Int> = [1, 2, 1, 5, 1, 3]
                expect(safeArray.startIndex) == 0
            }
            it("test var endIndex: ArrayType.Index") {
                let safeArray: TuringSafeArray<Int> = [1, 2, 1, 5, 1, 3]
                expect(safeArray.endIndex) == 6
            }
            it("test func index(after index: Index) -> Index") {
                let safeArray: TuringSafeArray<Int> = [1, 2, 1, 5, 1, 3]
                expect(safeArray.index(after: 0)) == 1
            }
            it("test func index(before index: Index) -> Index") {
                let safeArray: TuringSafeArray<Int> = [1, 2, 1, 5, 1, 3]
                expect(safeArray.index(before: 2)) == 1
            }
            it("test func index(_ index: Index, offsetBy: Index) -> Index") {
                let safeArray: TuringSafeArray<Int> = [1, 2, 1, 5, 1, 3]
                expect(safeArray.index(0, offsetBy: 2)) == 2
            }
            it("test func index(_ index: Index, offsetBy: Index, limitedBy: Index) -> Index?") {
                let safeArray: TuringSafeArray<Int> = [1, 2, 1, 5, 1, 3]
                expect(safeArray.index(0, offsetBy: 2, limitedBy: 10)) == 2
                expect(safeArray.index(0, offsetBy: 2, limitedBy: 1)).to(beNil())
            }
            it("test func formIndex(after index: inout Index)") {
                let safeArray: TuringSafeArray<Int> = [1, 2, 1, 5, 1, 3]
                var index: Int = 0
                safeArray.formIndex(after: &index)
                expect(index) == 1
            }
            it("test func formIndex(before index: inout Index)") {
                let safeArray: TuringSafeArray<Int> = [1, 2, 1, 5, 1, 3]
                var index: Int = 2
                safeArray.formIndex(before: &index)
                expect(index) == 1
            }
            it("test func distance(from start: Index, to end: Index) -> Index") {
                let safeArray: TuringSafeArray<Int> = [1, 2, 1, 5, 1, 3]
                expect(safeArray.distance(from: 1, to: 3)) == 2
            }
        }
    }
}
