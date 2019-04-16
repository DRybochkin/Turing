//
//  TestTuringSafeArrayFindingSpec.swift
//  TuringSafe_Tests
//
//  Created by Dmitry Rybochkin on 16/04/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Quick
import Nimble
import TuringSafe

final class TestTuringSafeArrayFindingSpec: QuickSpec {

    // MARK: - Life cycle

    override func spec() {
        describe("these will success") {
            it("can do contains element") {
                let safeArray: TuringSafeArray<Int> = [1, 2, 3]
                expect(safeArray.contains(2)) == true
                expect(safeArray.contains(20)) == false
            }
            it("can do contains where") {
                let safeArray: TuringSafeArray<Int> = [1, 2, 3]
                expect(safeArray.contains(where: { $0 > 0 })) == true
                expect(safeArray.contains(where: { $0 <= 0 })) == false
            }
            it("can do allSatisfy") {
                let safeArray: TuringSafeArray<Int> = [1, 2, 3]
                expect(safeArray.allSatisfy({ $0 > 0 })) == true
                expect(safeArray.allSatisfy({ $0 > 1 })) == false
            }
            it("can do first where") {
                let safeArray: TuringSafeArray<Int> = [1, 2, 3, 4]
                expect(safeArray.first(where: { $0 > 2 })) == 3
                expect(safeArray.first(where: { $0 >= 2 })) == 2
                expect(safeArray.first(where: { $0 >= 20 })).to(beNil())
            }
            it("can do first index of") {
                let safeArray: TuringSafeArray<Int> = [1, 2, 1, 2, 1, 3]
                expect(safeArray.firstIndex(of: 2)) == 1
                expect(safeArray.firstIndex(of: 0)).to(beNil())
            }
            it("can do first index where") {
                let safeArray: TuringSafeArray<Int> = [3, 2, 1, 2, 1, 3]
                expect(safeArray.firstIndex(where: { $0 == 1 })) == 2
                expect(safeArray.firstIndex(where: { $0 == 20 })).to(beNil())
            }
            it("can do last where") {
                let safeArray: TuringSafeArray<Int> = [1, 2, 3, 4]
                expect(safeArray.last(where: { $0 > 2 })) == 4
                expect(safeArray.last(where: { $0 <= 2 })) == 2
                expect(safeArray.last(where: { $0 >= 20 })).to(beNil())
            }
            it("can do last index of") {
                let safeArray: TuringSafeArray<Int> = [1, 2, 1, 3]
                expect(safeArray.lastIndex(of: 1)) == 2
                expect(safeArray.lastIndex(of: 0)).to(beNil())
            }
            it("can do last index where") {
                let safeArray: TuringSafeArray<Int> = [1, 2, 3, 2, 3]
                expect(safeArray.lastIndex(where: { $0 == 2 })) == 3
                expect(safeArray.lastIndex(where: { $0 == 20 })).to(beNil())
            }
            it("can do min") {
                let safeArray: TuringSafeArray<Int> = [1, 2, 1, 3]
                expect(safeArray.min()) == 1
            }
            it("can do max") {
                let safeArray: TuringSafeArray<Int> = [1, 2, 1, 3]
                expect(safeArray.max()) == 3
            }
            it("can do min by") {
                let safeArray: TuringSafeArray<Int> = [1, 2, 1, 3]
                expect(safeArray.min(by: { $0 > $1 })) == 3
            }
            it("can do max by") {
                let safeArray: TuringSafeArray<Int> = [1, 2, 1, 3]
                expect(safeArray.max(by: { $0 < $1 })) == 3
            }
        }
    }
}

