//
//  TestTuringSafeArrayCombiningSpec.swift
//  TuringSafe_Tests
//
//  Created by Dmitry Rybochkin on 16/04/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Quick
import Nimble
import TuringSafeArray

final class TestTuringSafeArrayCombiningSpec: QuickSpec {

    // MARK: - Life cycle

    override func spec() {
        describe("these will success") {
            it("test func append<S>(contentsOf newElements: S) where S: Sequence, Value == S.Element") {
                let safeArray: TuringSafeArray<Int> = [1, 2, 3]
                safeArray.append(contentsOf: [10, 20, 30])
                expect(safeArray.count) == 6
                expect(safeArray == [1, 2, 3, 10, 20, 30]) == true
            }
            it("test func +<Other>(lhs: Other, rhs: TuringSafeArray<Value>) -> Array<Value> where Other: Sequence, Value == Other.Element") {
                let array: [Int] = [10, 20, 30]
                let safeArray: TuringSafeArray<Int> = [1, 2, 3]
                let newArray: [Int] = array + safeArray
                expect(newArray.count) == 6
                expect(newArray == [10, 20, 30, 1, 2, 3]) == true
            }
            it("test func +<Other>(lhs: TuringSafeArray<Value>, rhs: Other) -> TuringSafeArray<Value> where Other: Sequence, Value == Other.Element") {
                let array: [Int] = [10, 20, 30]
                let safeArray: TuringSafeArray<Int> = [1, 2, 3]
                let newArray: TuringSafeArray<Int> = safeArray + array
                expect(newArray.count) == 6
                expect(newArray == [1, 2, 3, 10, 20, 30]) == true
            }
            it("test func +=(lhs: inout Array<Value>, rhs: TuringSafeArray<Value>)") {
                var array: [Int] = [10, 20, 30]
                let safeArray: TuringSafeArray<Int> = [1, 2, 3]
                array += safeArray
                expect(array.count) == 6
                expect(array == [10, 20, 30, 1, 2, 3]) == true
            }
            it("test func +=(lhs: inout TuringSafeArray<Value>, rhs: Array<Value>)") {
                let array: [Int] = [10, 20, 30]
                var safeArray: TuringSafeArray<Int> = [1, 2, 3]
                safeArray += array
                expect(safeArray.count) == 6
                expect(safeArray == [1, 2, 3, 10, 20, 30]) == true
            }
        }
    }
}
