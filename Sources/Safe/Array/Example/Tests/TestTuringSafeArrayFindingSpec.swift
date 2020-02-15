//
//  TestTuringSafeArrayFindingSpec.swift
//  TuringSafe_Tests
//
//  Created by Dmitry Rybochkin on 16/04/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Quick
import Nimble
import TuringSafeArray

final class TestTuringSafeArrayFindingSpec: QuickSpec {

    // MARK: - Life cycle

    //swiftlint:disable:next function_body_length
    override func spec() {
        describe("these will success") {
            it("test func contains(_ element: Element) -> Bool") {
                let safeArray: TuringSafeArray<Int> = [1, 2, 3]
                expect(safeArray.contains(2)) == true
                expect(safeArray.contains(20)) == false
            }
            it("test func contains(where predicate: (Element) throws -> Bool) rethrows -> Bool") {
                let safeArray: TuringSafeArray<Int> = [1, 2, 3]
                expect(safeArray.contains(where: { $0 > 0 })) == true
                expect(safeArray.contains(where: { $0 <= 0 })) == false
            }
            it("test func allSatisfy(_ predicate: (Element) throws -> Bool) rethrows -> Bool") {
                let safeArray: TuringSafeArray<Int> = [1, 2, 3]
                expect(safeArray.allSatisfy({ $0 > 0 })) == true
                expect(safeArray.allSatisfy({ $0 > 1 })) == false
            }
            it("test func first(where predicate: (Element) throws -> Bool) rethrows -> Element?") {
                let safeArray: TuringSafeArray<Int> = [1, 2, 3, 4]
                expect(safeArray.first(where: { $0 > 2 })) == 3
                expect(safeArray.first(where: { $0 >= 2 })) == 2
                expect(safeArray.first(where: { $0 >= 20 })).to(beNil())
            }
            it("test func firstIndex(of element: Element) -> Index?") {
                let safeArray: TuringSafeArray<Int> = [1, 2, 1, 2, 1, 3]
                expect(safeArray.firstIndex(of: 2)) == 1
                expect(safeArray.firstIndex(of: 0)).to(beNil())
            }
            it("test func firstIndex(where predicate: (Element) throws -> Bool) rethrows -> Index?") {
                let safeArray: TuringSafeArray<Int> = [3, 2, 1, 2, 1, 3]
                expect(safeArray.firstIndex(where: { $0 == 1 })) == 2
                expect(safeArray.firstIndex(where: { $0 == 20 })).to(beNil())
            }
            it("test func last(where predicate: (Element) throws -> Bool) rethrows -> Element?") {
                let safeArray: TuringSafeArray<Int> = [1, 2, 3, 4]
                expect(safeArray.last(where: { $0 > 2 })) == 4
                expect(safeArray.last(where: { $0 <= 2 })) == 2
                expect(safeArray.last(where: { $0 >= 20 })).to(beNil())
            }
            it("test func lastIndex(of element: Element) -> Index?") {
                let safeArray: TuringSafeArray<Int> = [1, 2, 1, 3]
                expect(safeArray.lastIndex(of: 1)) == 2
                expect(safeArray.lastIndex(of: 0)).to(beNil())
            }
            it("test func lastIndex(where predicate: (Element) throws -> Bool) rethrows -> Index?") {
                let safeArray: TuringSafeArray<Int> = [1, 2, 3, 2, 3]
                expect(safeArray.lastIndex(where: { $0 == 2 })) == 3
                expect(safeArray.lastIndex(where: { $0 == 20 })).to(beNil())
            }
            it("test func min() -> Element?") {
                let safeArray: TuringSafeArray<Int> = [1, 2, 1, 3]
                expect(safeArray.min()) == 1
            }
            it("test func max() -> Element?") {
                let safeArray: TuringSafeArray<Int> = [1, 2, 1, 3]
                expect(safeArray.max()) == 3
            }
            it("test func min(by areInIncreasingOrder: (Element, Element) throws -> Bool) rethrows -> Element?") {
                let safeArray: TuringSafeArray<Int> = [1, 2, 1, 3]
                expect(safeArray.min(by: { $0 > $1 })) == 3
            }
            it("test func max(by areInIncreasingOrder: (Element, Element) throws -> Bool) rethrows -> Element?") {
                let safeArray: TuringSafeArray<Int> = [1, 2, 1, 3]
                expect(safeArray.max(by: { $0 < $1 })) == 3
            }
        }
    }
}
