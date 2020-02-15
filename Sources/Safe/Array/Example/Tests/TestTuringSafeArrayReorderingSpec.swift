//
//  TestTuringSafeArrayReorderingSpec.swift
//  TuringSafe_Tests
//
//  Created by Dmitry Rybochkin on 16/04/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Quick
import Nimble
import TuringSafeArray

final class TestTuringSafeArrayReorderingSpec: QuickSpec {

    // MARK: - Life cycle

    override func spec() {
        describe("these will success") {
            it("test func sort()") {
                let safeArray: TuringSafeArray<Int> = [1, 2, 1, 5, 1, 3]
                safeArray.sort()
                expect(safeArray == [1, 1, 1, 2, 3, 5]) == true
            }
            it("test func sorted() -> TuringSafeArray<Element>") {
                let safeArray: TuringSafeArray<Int> = [1, 2, 1, 5, 1, 3]
                let sorted = safeArray.sorted()
                expect(sorted == [1, 1, 1, 2, 3, 5]) == true
            }
            it("test func sort(by areInIncreasingOrder: @escaping (Element, Element) throws -> Bool) rethrows") {
                let safeArray: TuringSafeArray<Int> = [1, 2, 1, 5, 1, 3]
                safeArray.sort(by: { $0 > $1 })
                expect(safeArray == [5, 3, 2, 1, 1, 1]) == true
            }
            //swiftlint:disable:next line_length
            it("test func sorted(by areInIncreasingOrder: (Element, Element) throws -> Bool) rethrows -> TuringSafeArray<Element>") {
                let safeArray: TuringSafeArray<Int> = [1, 2, 1, 5, 1, 3]
                let sorted = safeArray.sorted(by: { $0 > $1 })
                expect(sorted == [5, 3, 2, 1, 1, 1]) == true
            }
            it("test func reverse()") {
                let safeArray: TuringSafeArray<Int> = [1, 2, 1, 5, 1, 3]
                safeArray.reverse()
                expect(safeArray == [3, 1, 5, 1, 2, 1]) == true
            }
            it("test func shuffle()") {
                let testArray =  [1, 2, 1, 5, 1, 3]
                let safeArray = TuringSafeArray<Int>(testArray)
                expect(safeArray.shuffled() == testArray.shuffled()) == false
                expect(safeArray.shuffled().sorted() == testArray.shuffled().sorted()) == true
            }
            it("test func swapAt(_ indexI: Int, _ indexJ: Int)") {
                let safeArray: TuringSafeArray<Int> = [1, 2, 1, 5, 1, 3]
                safeArray.swapAt(1, 4)
                expect(safeArray == [1, 1, 1, 5, 2, 3]) == true
            }
        }
    }
}
