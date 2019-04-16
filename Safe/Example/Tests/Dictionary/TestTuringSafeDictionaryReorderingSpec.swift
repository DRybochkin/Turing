//
//  TestTuringSafeDictionaryReorderingSpec.swift
//  TuringSafe_Tests
//
//  Created by Dmitry Rybochkin on 16/04/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Quick
import Nimble
import TuringSafe

final class TestTuringSafeDictionaryReorderingSpec: QuickSpec {

    // MARK: - Life cycle

    override func spec() {
        describe("these will success") {
            it("can do sort") {
                let safedictionary: TuringSafeDictionary<Int> = [1, 2, 1, 5, 1, 3]
                safedictionary.sort()
                expect(safedictionary == [1, 1, 1, 2, 3, 5]) == true
            }
            it("can do sorted") {
                let safedictionary: TuringSafeDictionary<Int> = [1, 2, 1, 5, 1, 3]
                let sorted = safedictionary.sorted()
                expect(sorted == [1, 1, 1, 2, 3, 5]) == true
            }
            it("can do sort areInIncreasingOrder") {
                let safedictionary: TuringSafeDictionary<Int> = [1, 2, 1, 5, 1, 3]
                safedictionary.sort(by: { $0 > $1 })
                expect(safedictionary == [5, 3, 2, 1, 1, 1]) == true
            }
            it("can do sorted areInIncreasingOrder") {
                let safedictionary: TuringSafeDictionary<Int> = [1, 2, 1, 5, 1, 3]
                let sorted = safedictionary.sorted(by: { $0 > $1 })
                expect(sorted == [5, 3, 2, 1, 1, 1]) == true
            }
            it("can do reverse") {
                let safedictionary: TuringSafeDictionary<Int> = [1, 2, 1, 5, 1, 3]
                safedictionary.reverse()
                expect(safedictionary == [3, 1, 5, 1, 2, 1]) == true
            }
            it("can do swap") {
                let safedictionary: TuringSafeDictionary<Int> = [1, 2, 1, 5, 1, 3]
                safedictionary.swapAt(1, 4)
                expect(safedictionary == [1, 1, 1, 5, 2, 3]) == true
            }
        }
    }
}
