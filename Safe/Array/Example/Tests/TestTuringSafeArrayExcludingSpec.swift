//
//  TestTuringSafeArrayExcludingSpec.swift
//  TuringSafe_Tests
//
//  Created by Dmitry Rybochkin on 16/04/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Quick
import Nimble
import TuringSafeArray

final class TestTuringSafeArrayExcludingSpec: QuickSpec {

    // MARK: - Life cycle

    override func spec() {
        describe("these will success") {
            it("test func dropFirst(_ count: Int = 1) -> TuringSafeArray<Element>") {
                let safeArray: TuringSafeArray<Int> = [1, 2, 1, 5, 1, 3]
                let dropped = safeArray.dropFirst(3)
                expect(dropped == [5, 1, 3]) == true
                expect(safeArray == [1, 2, 1, 5, 1, 3]) == true
            }
            it("test func dropLast(_ count: Int = 1) -> TuringSafeArray<Element>") {
                let safeArray: TuringSafeArray<Int> = [1, 2, 1, 5, 1, 3]
                let dropped = safeArray.dropLast(3)
                expect(dropped == [1, 2, 1]) == true
                expect(safeArray == [1, 2, 1, 5, 1, 3]) == true
            }
            it("test func drop(while predicate: (Element) throws -> Bool) rethrows -> TuringSafeArray<Element>") {
                let safeArray: TuringSafeArray<Int> = [1, 2, 1, 5, 1, 3]
                let dropped = safeArray.drop(while: { $0 < 5 })
                expect(dropped == [5, 1, 3]) == true
                expect(safeArray == [1, 2, 1, 5, 1, 3]) == true
            }
        }
    }
}
