//
//  TestTuringSafeArrayInitSpec.swift
//  TuringSafe_Tests
//
//  Created by Dmitry Rybochkin on 16/04/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Quick
import Nimble
import TuringSafeArray

final class TestTuringSafeArrayInitSpec: QuickSpec {

    // MARK: - Life cycle

    override func spec() {
        describe("these will success") {
            it("test init(isConcurrent: Bool)") {
                let safeArray = TuringSafeArray<Int>(isConcurrent: true)
                expect(safeArray.count) == 0
                let safeArray1 = TuringSafeArray<Int>(isConcurrent: false)
                expect(safeArray1.count) == 0
            }
            it("test init()") {
                let safeArray = TuringSafeArray<Int>()
                expect(safeArray.count) == 0
            }
            it("test  init<S>(_ elements: S) where S: Sequence, Value == S.Element") {
                let safeArray = TuringSafeArray<Int>([0, 100, 200])
                expect(safeArray.count) == 3
                expect(safeArray.first) == 0
                expect(safeArray.last) == 200
                expect(safeArray[1]) == 100
            }
            it("test init(repeating repeatedValue: Value, count: Int)") {
                let safeArray = TuringSafeArray<Int>(repeating: 2, count: 3)
                expect(safeArray.count) == 3
                expect(safeArray.first) == 2
                expect(safeArray.last) == 2
                expect(safeArray[1]) == 2
            }
            it("test init(arrayLiteral elements: (Value)...)") {
                let safeArray: TuringSafeArray<Int> = [0, 100, 200]
                expect(safeArray.count) == 3
                expect(safeArray.first) == 0
                expect(safeArray.last) == 200
                expect(safeArray[1]) == 100
            }
        }
    }
}
