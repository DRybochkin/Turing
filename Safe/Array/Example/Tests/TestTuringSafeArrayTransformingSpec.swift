//
//  TestTuringSafeArrayTransformingSpec.swift
//  TuringSafe_Tests
//
//  Created by Dmitry Rybochkin on 16/04/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Quick
import Nimble
import TuringSafeArray

final class TestTuringSafeArrayTransformingSpec: QuickSpec {

    // MARK: - Life cycle

    override func spec() {
        describe("these will success") {
            it("test var lazy: LazySequence<Array<Element>>") {
                let safeArray: TuringSafeArray<Int> = [1, 2, 1, 5, 1, 3]
                expect(safeArray.lazy.elements == [1, 2, 1, 5, 1, 3]) == true
            }
            it("test func map<T>(_ transform: (Element) throws -> T) rethrows -> [T]") {
                let safeArray: TuringSafeArray<Int> = [1, 2, 1, 5, 1, 3]
                expect(safeArray.map({ $0 + 10 }) == [11, 12, 11, 15, 11, 13]) == true
            }
            it("test func compactMap<ElementOfResult>(_ transform: (Element) throws -> ElementOfResult?) rethrows -> [ElementOfResult]") {
                let safeArray: TuringSafeArray<Int> = [1, 2, 1, 5, 1, 3]
                let result: [Int] = safeArray.compactMap({ $0 + 10 })
                expect(result == [11, 12, 11, 15, 11, 13]) == true
                let safeResult: [Int] = safeArray.compactMap({ $0 + 10 })
                expect(safeResult == [11, 12, 11, 15, 11, 13]) == true
            }
            it("test func compactMap<ElementOfResult>(_ transform: (Element) throws -> ElementOfResult?) rethrows -> TuringSafeArray<ElementOfResult>") {
                let safeArray: TuringSafeArray<Int> = [1, 2, 1, 5, 1, 3]
                let result: [Int] = safeArray.compactMap({ $0 + 10 })
                expect(result == [11, 12, 11, 15, 11, 13]) == true
                let safeResult: TuringSafeArray<Int> = safeArray.compactMap({ $0 + 10 })
                expect(safeResult == [11, 12, 11, 15, 11, 13]) == true
            }
            it("test func reduce<Result>(_ initialResult: Result, _ nextPartialResult: (Result, Element) throws -> Result) rethrows -> Result") {
                let safeArray: TuringSafeArray<Int> = [1, 2, 1, 5, 1, 3]
                expect(safeArray.reduce(0, +)) == 13
            }
            it("test func reduce<Result>(into initialResult: Result, _ updateAccumulatingResult: (inout Result, Element) throws -> ()) rethrows -> Resultt") {
                let safeArray: TuringSafeArray<Int> = [1, 2, 1, 5, 1, 3]
                expect(safeArray.reduce(0, { $0 + $1 })) == 13
            }
        }
    }
}
