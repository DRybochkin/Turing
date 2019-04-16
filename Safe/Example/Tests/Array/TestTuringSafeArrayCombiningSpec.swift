//
//  TestTuringSafeArrayCombiningSpec.swift
//  TuringSafe_Tests
//
//  Created by Dmitry Rybochkin on 16/04/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Quick
import Nimble
import TuringSafe

final class TestTuringSafeArrayCombiningSpec: QuickSpec {

    // MARK: - Life cycle

    override func spec() {
        describe("these will success") {
            it("can do append sequence") {
                let safeArray: TuringSafeArray<Int> = [1, 2, 3]
                safeArray.append(contentsOf: [10, 20, 30])
                expect(safeArray.count) == 6
                expect(safeArray == [1, 2, 3, 10, 20, 30]) == true
            }
            it("can do operator sequence + safe array") {
                let array: [Int] = [10, 20, 30]
                let safeArray: TuringSafeArray<Int> = [1, 2, 3]
                let newArray: [Int] = array + safeArray
                expect(newArray.count) == 6
                expect(newArray == [10, 20, 30, 1, 2, 3]) == true
            }
            it("can do operator safe array + sequence") {
                let array: [Int] = [10, 20, 30]
                let safeArray: TuringSafeArray<Int> = [1, 2, 3]
                let newArray: TuringSafeArray<Int> = safeArray + array
                expect(newArray.count) == 6
                expect(newArray == [1, 2, 3, 10, 20, 30]) == true
            }
            it("can do operator safe array += sequence") {
                var array: [Int] = [10, 20, 30]
                let safeArray: TuringSafeArray<Int> = [1, 2, 3]
                array += safeArray
                expect(array.count) == 6
                expect(array == [10, 20, 30, 1, 2, 3]) == true
            }
            it("can do operator safe sequence + array") {
                let array: [Int] = [10, 20, 30]
                var safeArray: TuringSafeArray<Int> = [1, 2, 3]
                safeArray += array
                expect(safeArray.count) == 6
                expect(safeArray == [1, 2, 3, 10, 20, 30]) == true
            }
        }
    }
}
