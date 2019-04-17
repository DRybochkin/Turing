//
//  TestTuringSafeValueArithmeticSpec.swift
//  TuringSafeValue_Tests
//
//  Created by Dmitry Rybochkin on 17/04/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Quick
import Nimble
import TuringSafeValue

final class TestTuringSafeValueArithmeticSpec: QuickSpec {

    // MARK: - Life cycle

    override func spec() {
        describe("these will success") {
            it("test var zero: TuringSafeValue") {
                expect(§TuringSafeValue<Int>.zero) == Int.zero
                expect(TuringSafeValue<Double>.zero.value) == Double.zero
            }
            it("test func -= (lhs: inout TuringSafeValue<T>, rhs: TuringSafeValue<T>)") {
                var safeValue1 = §10
                var safeValue2 = §6
                let safeValue3 = §(-4)
                safeValue1 -= safeValue2
                safeValue2 -= safeValue3
                expect(safeValue1.value) == 4
                expect(safeValue2.value) == 10
            }
            it("test func - (lhs: TuringSafeValue<T>, rhs: TuringSafeValue<T>) -> Self") {
                let safeValue = §10 - §7
                expect(safeValue.value) != 4
                expect(§safeValue) == 3
            }
            it("test func += (lhs: inout TuringSafeValue<T>, rhs: TuringSafeValue<T>)") {
                var safeValue1 = §10
                var safeValue2 = §6
                let safeValue3 = §(-4)
                safeValue1 += safeValue2
                safeValue2 += safeValue3
                expect(safeValue1.value) == 16
                expect(safeValue2.value) == 2
            }
            it("test func + (lhs: TuringSafeValue<T>, rhs: TuringSafeValue<T>) -> Self") {
                let safeValue = §10 + §7
                expect(safeValue.value) != 10
                expect(§safeValue) == 17
            }
            it("test func +=(lhs: TuringSafeValue<T>, rhs: T)") {
                let safeValue1 = §10
                let safeValue2 = §(-4)
                safeValue1 += 1
                safeValue2 += 5
                expect(safeValue1.value) == 11
                expect(safeValue2.value) == 1
            }
            it("test func -=(lhs: TuringSafeValue<T>, rhs: T)") {
                let safeValue1 = §10
                let safeValue2 = §(-4)
                safeValue1 -= 1
                safeValue2 -= 5
                expect(safeValue1.value) == 9
                expect(safeValue2.value) == -9
            }
            it("test func +=(lhs: inout T, rhs: TuringSafeValue<T>)") {
                var int1 = 10
                var int2 = -4
                int1 += §1
                int2 += §5
                expect(int1) == 11
                expect(int2) == 1
            }
            it("test func -=(lhs: inout T, rhs: TuringSafeValue<T>)") {
                var int1 = 10
                var int2 = -4
                int1 -= §1
                int2 -= §5
                expect(int1) == 9
                expect(int2) == -9
            }
        }
    }
}
