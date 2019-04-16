//
//  TestTuringSafeArrayAddingSpec.swift
//  TuringSafe_Tests
//
//  Created by Dmitry Rybochkin on 16/04/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Quick
import Nimble
import TuringSafe

final class TestTuringSafeArrayAddingSpec: QuickSpec {

    // MARK: - Life cycle

    override func spec() {
        describe("these will success") {
            it("can do append") {
                let safeArray: TuringSafeArray<Int> = []
                safeArray.append(101)
                expect(safeArray.count) == 1
                expect(safeArray[0]) == 101
            }
            it("can do insert in index") {
                let safeArray: TuringSafeArray<Int> = [0, 1, 2, 3]
                safeArray.insert(10, at: 2)
                expect(safeArray.count) == 5
                expect(safeArray == [0, 1, 10, 2, 3]) == true
            }
            it("can do insert sequense") {
                let safeArray: TuringSafeArray<Int> = [0, 1, 2, 3]
                safeArray.insert(contentsOf: [10, 20, 30], at: 3)
                expect(safeArray.count) == 7
                expect(safeArray == [0, 1, 2, 10, 20, 30, 3]) == true
            }
            it("can do replce subrange") {
                let safeArray: TuringSafeArray<Int> = [0, 1, 2, 3, 4, 5, 6]
                safeArray.replaceSubrange(2..<4, with: [10, 20, 30])
                expect(safeArray.count) == 8
                expect(safeArray == [0, 1, 10, 20, 30, 4, 5, 6]) == true
            }
            it("can do replce subrange range") {
                let safeArray: TuringSafeArray<Int> = [0, 1, 2, 3, 4, 5, 6]
                let range = Range<Int>.init(uncheckedBounds: (2, 4))
                safeArray.replaceSubrange(range, with: [10, 20, 30])
                expect(safeArray.count) == 8
                expect(safeArray == [0, 1, 10, 20, 30, 4, 5, 6]) == true
            }
            it("can do reverse capacity") {
                let safeArray: TuringSafeArray<Int> = [0, 1, 2, 3, 4, 5, 6]
                safeArray.reserveCapacity(100)
                expect(safeArray.capacity) >= 100
            }
            it("can do operand += element") {
                var safeArray: TuringSafeArray<Int> = [0, 1, 2, 3, 4, 5, 6]
                safeArray += 10
                expect(safeArray.count) == 8
                expect(safeArray == [0, 1, 2, 3, 4, 5, 6, 10]) == true
            }
            it("can do operand += array") {
                var safeArray: TuringSafeArray<Int> = [0, 1, 2, 3, 4, 5, 6]
                safeArray += [10, 20, 30]
                expect(safeArray.count) == 10
                expect(safeArray == [0, 1, 2, 3, 4, 5, 6, 10, 20, 30]) == true
            }
        }
    }
}

