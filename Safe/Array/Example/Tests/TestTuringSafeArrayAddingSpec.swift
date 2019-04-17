//
//  TestTuringSafeArrayAddingSpec.swift
//  TuringSafe_Tests
//
//  Created by Dmitry Rybochkin on 16/04/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Quick
import Nimble
import TuringSafeArray

final class TestTuringSafeArrayAddingSpec: QuickSpec {

    // MARK: - Life cycle

    override func spec() {
        describe("these will success") {
            it("test func append(_ newElement: Value)") {
                let safeArray: TuringSafeArray<Int> = []
                safeArray.append(101)
                expect(safeArray.count) == 1
                expect(safeArray[0]) == 101
            }
            it("test func insert(_ newElement: Value, at index: Index)") {
                let safeArray: TuringSafeArray<Int> = [0, 1, 2, 3]
                safeArray.insert(10, at: 2)
                expect(safeArray.count) == 5
                expect(safeArray == [0, 1, 10, 2, 3]) == true
            }
            it("test func insert<S>(contentsOf newElements: S, at index: Index) where S: Collection, Value == S.Element") {
                let safeArray: TuringSafeArray<Int> = [0, 1, 2, 3]
                safeArray.insert(contentsOf: [10, 20, 30], at: 3)
                expect(safeArray.count) == 7
                expect(safeArray == [0, 1, 2, 10, 20, 30, 3]) == true
            }
            it("test func replaceSubrange<C>(_ subrange: Range<Int>, with newElements: C) where Value == C.Element, C: Collection") {
                let safeArray: TuringSafeArray<Int> = [0, 1, 2, 3, 4, 5, 6]
                safeArray.replaceSubrange(2..<4, with: [10, 20, 30])
                expect(safeArray.count) == 8
                expect(safeArray == [0, 1, 10, 20, 30, 4, 5, 6]) == true
            }
            it("test func replaceSubrange<C, R>(_ subrange: R, with newElements: C) where C: Collection, R: RangeExpression, Value == C.Element, Index == R.Bound") {
                let safeArray: TuringSafeArray<Int> = [0, 1, 2, 3, 4, 5, 6]
                let range = Range<Int>.init(uncheckedBounds: (2, 4))
                safeArray.replaceSubrange(range, with: [10, 20, 30])
                expect(safeArray.count) == 8
                expect(safeArray == [0, 1, 10, 20, 30, 4, 5, 6]) == true
            }
            it("test func reserveCapacity(_ count: Int)") {
                let safeArray: TuringSafeArray<Int> = [0, 1, 2, 3, 4, 5, 6]
                safeArray.reserveCapacity(100)
                expect(safeArray.capacity) >= 100
            }
            it("test func +=(lhs: inout TuringSafeArray<Element>, rhs: Element)") {
                var safeArray: TuringSafeArray<Int> = [0, 1, 2, 3, 4, 5, 6]
                safeArray += 10
                expect(safeArray.count) == 8
                expect(safeArray == [0, 1, 2, 3, 4, 5, 6, 10]) == true
            }
            it("test func +=(lhs: inout TuringSafeArray<Element>, rhs: TuringSafeArray<Element>)") {
                var safeArray: TuringSafeArray<Int> = [0, 1, 2, 3, 4, 5, 6]
                safeArray += [10, 20, 30]
                expect(safeArray.count) == 10
                expect(safeArray == [0, 1, 2, 3, 4, 5, 6, 10, 20, 30]) == true
            }
        }
    }
}

