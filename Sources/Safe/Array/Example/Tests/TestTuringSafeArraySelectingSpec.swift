//
//  TestTuringSafeArraySelectingSpec.swift
//  TuringSafe_Tests
//
//  Created by Dmitry Rybochkin on 16/04/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Quick
import Nimble
import TuringSafeArray

final class TestTuringSafeArraySelectingSpec: QuickSpec {

    // MARK: - Life cycle

    override func spec() {
        describe("these will success") {
            it("test func filter(_ isIncluded: (Element) throws -> Bool) rethrows -> TuringSafeArray<Element>") {
                let safeArray: TuringSafeArray<Int> = [1, 2, 1, 5, 1, 3]
                expect(safeArray.filter({ $0 == 1 }) == [1, 1, 1]) == true
            }
            it("test func prefix(_ maxLength: Int) -> TuringSafeArray<Element>") {
                let safeArray: TuringSafeArray<Int> = [1, 2, 1, 5, 1, 3]
                expect(safeArray.prefix(3) == [1, 2, 1]) == true
            }
            it("test func prefix(through position: Index) -> TuringSafeArray<Element>") {
                let safeArray: TuringSafeArray<Int> = [1, 2, 1, 5, 1, 3]
                expect(safeArray.prefix(through: 3) == [1, 2, 1, 5]) == true
            }
            it("test func prefix(upTo end: Index) -> TuringSafeArray<Element>") {
                let safeArray: TuringSafeArray<Int> = [1, 2, 1, 5, 1, 3]
                expect(safeArray.prefix(upTo: 3) == [1, 2, 1]) == true
            }
            it("test func prefix(while predicate: (Element) throws -> Bool) rethrows -> TuringSafeArray<Element>") {
                let safeArray: TuringSafeArray<Int> = [1, 2, 1, 5, 1, 3]
                expect(safeArray.prefix(while: { $0 < 5 }) == [1, 2, 1]) == true
            }
            it("test func suffix(_ maxLength: Int) -> TuringSafeArray<Element>") {
                let safeArray: TuringSafeArray<Int> = [1, 2, 1, 5, 1, 3]
                expect(safeArray.suffix(3) == [5, 1, 3]) == true
            }
            it("test func suffix(from start: Index) -> TuringSafeArray<Element>") {
                let safeArray: TuringSafeArray<Int> = [1, 2, 1, 5, 1, 3]
                expect(safeArray.suffix(from: 3) == [5, 1, 3]) == true
            }
        }
    }
}
