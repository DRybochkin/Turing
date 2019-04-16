//
//  TestTuringSafeArrayManipulatingSpec.swift
//  TuringSafe_Tests
//
//  Created by Dmitry Rybochkin on 16/04/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Quick
import Nimble
import TuringSafe

final class TestTuringSafeArrayManipulatingSpec: QuickSpec {

    // MARK: - Life cycle

    override func spec() {
        describe("these will success") {
            it("can do indices") {
                let safeArray: TuringSafeArray<Int> = [1, 2, 1, 5, 1, 3]
                expect(safeArray.indices == 0..<6) == true
            }
            it("can do startIndex") {
                let safeArray: TuringSafeArray<Int> = [1, 2, 1, 5, 1, 3]
                expect(safeArray.startIndex) == 0
            }
            it("can do endIndex") {
                let safeArray: TuringSafeArray<Int> = [1, 2, 1, 5, 1, 3]
                expect(safeArray.endIndex) == 6
            }
            it("can do index after") {
                let safeArray: TuringSafeArray<Int> = [1, 2, 1, 5, 1, 3]
                expect(safeArray.index(after: 0)) == 1
            }
            it("can do index before") {
                let safeArray: TuringSafeArray<Int> = [1, 2, 1, 5, 1, 3]
                expect(safeArray.index(before: 2)) == 1
            }
            it("can do index offsetBy") {
                let safeArray: TuringSafeArray<Int> = [1, 2, 1, 5, 1, 3]
                expect(safeArray.index(0, offsetBy: 2)) == 2
            }
            it("can do index offsetBy limitedBy") {
                let safeArray: TuringSafeArray<Int> = [1, 2, 1, 5, 1, 3]
                expect(safeArray.index(0, offsetBy: 2, limitedBy: 10)) == 2
                expect(safeArray.index(0, offsetBy: 2, limitedBy: 1)).to(beNil())
            }
            it("can do index formIndex after") {
                let safeArray: TuringSafeArray<Int> = [1, 2, 1, 5, 1, 3]
                var index: Int = 0
                safeArray.formIndex(after: &index)
                expect(index) == 1
            }
            it("can do index formIndex before") {
                let safeArray: TuringSafeArray<Int> = [1, 2, 1, 5, 1, 3]
                var index: Int = 2
                safeArray.formIndex(before: &index)
                expect(index) == 1
            }
            it("can do index distance") {
                let safeArray: TuringSafeArray<Int> = [1, 2, 1, 5, 1, 3]
                expect(safeArray.distance(from: 1, to: 3)) == 2
            }
        }
    }
}
