//
//  TestTuringSafeDictionaryTransformingSpec.swift
//  TuringSafe_Tests
//
//  Created by Dmitry Rybochkin on 16/04/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Quick
import Nimble
import TuringSafe

final class TestTuringSafeDictionaryTransformingSpec: QuickSpec {

    // MARK: - Life cycle

    override func spec() {
        describe("these will success") {
            it("can do lazy") {
                let safedictionary: TuringSafeDictionary<Int> = [1, 2, 1, 5, 1, 3]
                expect(safedictionary.lazy.elements == [1, 2, 1, 5, 1, 3]) == true
            }
            it("can do map") {
                let safedictionary: TuringSafeDictionary<Int> = [1, 2, 1, 5, 1, 3]
                expect(safedictionary.map({ $0 + 10 }) == [11, 12, 11, 15, 11, 13]) == true
            }
            it("can do compactMap") {
                let safedictionary: TuringSafeDictionary<Int> = [1, 2, 1, 5, 1, 3]
                let result: [Int] = safedictionary.compactMap({ $0 + 10 })
                expect(result == [11, 12, 11, 15, 11, 13]) == true
                let safeResult: TuringSafeDictionary<Int> = safedictionary.compactMap({ $0 + 10 })
                expect(safeResult == [11, 12, 11, 15, 11, 13]) == true
            }
            it("can do reduce nextPartialResult") {
                let safedictionary: TuringSafeDictionary<Int> = [1, 2, 1, 5, 1, 3]
                expect(safedictionary.reduce(0, +)) == 13
            }
            it("can do reduce updateAccumulatingResult") {
                let safedictionary: TuringSafeDictionary<Int> = [1, 2, 1, 5, 1, 3]
                expect(safedictionary.reduce(0, { $0 + $1 })) == 13
            }
        }
    }
}
