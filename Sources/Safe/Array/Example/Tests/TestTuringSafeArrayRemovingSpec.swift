//
//  TestTuringSafeArrayRemovingSpec.swift
//  TuringSafe_Tests
//
//  Created by Dmitry Rybochkin on 16/04/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Quick
import Nimble
import TuringSafeArray

final class TestTuringSafeArrayRemovingSpec: QuickSpec {

    // MARK: - Life cycle

    //swiftlint:disable:next function_body_length
    override func spec() {
        describe("these will success") {
            it("test func remove(at index: Index) -> Value?") {
                let safeArray: TuringSafeArray<Int> = [0, 100, 200]
                safeArray.remove(at: 1)
                expect(safeArray == [0, 200]) == true
            }
            it("test func removeFirst() -> Value?") {
                let safeArray: TuringSafeArray<Int> = [0, 100, 200]
                safeArray.removeFirst()
                expect(safeArray == [100, 200]) == true
            }
            it("test func removeFirst(_ count: Int)") {
                let safeArray: TuringSafeArray<Int> = [0, 100, 200]
                safeArray.removeFirst(2)
                expect(safeArray == [200]) == true
            }
            it("test func removeLast() -> Value?") {
                let safeArray: TuringSafeArray<Int> = [0, 100, 200]
                safeArray.removeLast()
                expect(safeArray == [0, 100]) == true
            }
            it("test func removeLast(_ count: Int)") {
                let safeArray: TuringSafeArray<Int> = [0, 100, 200]
                safeArray.removeLast(2)
                expect(safeArray == [0]) == true
            }
            it("test func removeSubrange(_ bounds: Range<Int>)") {
                let safeArray: TuringSafeArray<Int> = [0, 1, 2, 3, 4, 5, 6]
                safeArray.removeSubrange(2..<4)
                expect(safeArray.count) == 5
                expect(safeArray == [0, 1, 4, 5, 6]) == true
            }
            it("test func removeSubrange<R>(_ bounds: R) where R: RangeExpression, Index == R.Bound") {
                let safeArray: TuringSafeArray<Int> = [0, 1, 2, 3, 4, 5, 6]
                let range = Range<Int>.init(uncheckedBounds: (2, 4))
                safeArray.removeSubrange(range)
                expect(safeArray.count) == 5
                expect(safeArray == [0, 1, 4, 5, 6]) == true
            }
            it("test func removeAll()") {
                let safeArray: TuringSafeArray<Int> = [0, 100, 200]
                safeArray.removeAll()
                expect(safeArray.isEmpty) == true
            }
            it("test func removeAll(where shouldBeRemoved: @escaping (Value) throws -> Bool) rethrows") {
                let safeArray: TuringSafeArray<Int> = [0, 100, 200]
                safeArray.removeAll(where: { $0 == 100 })
                expect(safeArray == [0, 200]) == true
            }
            it("test func removeAll(keepingCapacity keepCapacity: Bool)") {
                let safeArray: TuringSafeArray<Int> = [0, 100, 200]
                safeArray.removeAll(keepingCapacity: true)
                expect(safeArray.isEmpty) == true

                let safeArray1: TuringSafeArray<Int> = [0, 100, 200]
                safeArray1.removeAll(keepingCapacity: false)
                expect(safeArray1.isEmpty) == true
            }
            it("test func popLast() -> Value?") {
                let safeArray: TuringSafeArray<Int> = [0, 100, 200]
                let lastItem = safeArray.popLast()
                expect(lastItem) == 200
                expect(safeArray == [0, 100]) == true
            }
        }
    }
}
