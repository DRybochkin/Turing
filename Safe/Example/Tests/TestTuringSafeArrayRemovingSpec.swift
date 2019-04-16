//
//  TestTuringSafeArrayRemovingSpec.swift
//  TuringSafe_Tests
//
//  Created by Dmitry Rybochkin on 16/04/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Quick
import Nimble
import TuringSafe

final class TestTuringSafeArrayRemovingSpec: QuickSpec {

    // MARK: - Life cycle

    override func spec() {
        describe("these will success") {
            it("can do remove at index") {
                let safeArray: TuringSafeArray<Int> = [0, 100, 200]
                safeArray.remove(at: 1)
                expect(safeArray == [0, 200]) == true
            }
            it("can do remove first") {
                let safeArray: TuringSafeArray<Int> = [0, 100, 200]
                safeArray.removeFirst()
                expect(safeArray == [100, 200]) == true
            }
            it("can do remove first count") {
                let safeArray: TuringSafeArray<Int> = [0, 100, 200]
                safeArray.removeFirst(2)
                expect(safeArray == [200]) == true
            }
            it("can do remove last") {
                let safeArray: TuringSafeArray<Int> = [0, 100, 200]
                safeArray.removeLast()
                expect(safeArray == [0, 100]) == true
            }
            it("can do remove last count") {
                let safeArray: TuringSafeArray<Int> = [0, 100, 200]
                safeArray.removeLast(2)
                expect(safeArray == [0]) == true
            }
            it("can do remove subrange") {
                let safeArray: TuringSafeArray<Int> = [0, 1, 2, 3, 4, 5, 6]
                safeArray.removeSubrange(2..<4)
                expect(safeArray.count) == 5
                expect(safeArray == [0, 1, 4, 5, 6]) == true
            }
            it("can do remove subrange range") {
                let safeArray: TuringSafeArray<Int> = [0, 1, 2, 3, 4, 5, 6]
                let range = Range<Int>.init(uncheckedBounds: (2, 4))
                safeArray.removeSubrange(range)
                expect(safeArray.count) == 5
                expect(safeArray == [0, 1, 4, 5, 6]) == true
            }
            it("can do remove all") {
                let safeArray: TuringSafeArray<Int> = [0, 100, 200]
                safeArray.removeAll()
                expect(safeArray.isEmpty) == true
            }
            it("can do remove all where") {
                let safeArray: TuringSafeArray<Int> = [0, 100, 200]
                safeArray.removeAll(where: { $0 == 100 })
                expect(safeArray == [0, 200]) == true
            }
            it("can do remove last keepingCapacity: true") {
                let safeArray: TuringSafeArray<Int> = [0, 100, 200]
                safeArray.removeAll(keepingCapacity: true)
                expect(safeArray.isEmpty) == true
            }
            it("can do remove last keepingCapacity: false") {
                let safeArray: TuringSafeArray<Int> = [0, 100, 200]
                safeArray.removeAll(keepingCapacity: false)
                expect(safeArray.isEmpty) == true
            }
            it("can do pop last") {
                let safeArray: TuringSafeArray<Int> = [0, 100, 200]
                let lastItem = safeArray.popLast()
                expect(lastItem) == 200
                expect(safeArray == [0, 100]) == true
            }
        }
    }
}

