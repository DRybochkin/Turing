//
//  TestTuringSafeDictionaryAddingSpec.swift
//  TuringSafe_Tests
//
//  Created by Dmitry Rybochkin on 16/04/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Quick
import Nimble
import TuringSafe

final class TestTuringSafeDictionaryAddingSpec: QuickSpec {

    // MARK: - Life cycle

    override func spec() {
        describe("these will success") {
            it("can do append") {
                let safedictionary: TuringSafeDictionary<Int> = []
                safedictionary.append(101)
                expect(safedictionary.count) == 1
                expect(safedictionary[0]) == 101
            }
            it("can do insert in index") {
                let safedictionary: TuringSafeDictionary<Int> = [0, 1, 2, 3]
                safedictionary.insert(10, at: 2)
                expect(safedictionary.count) == 5
                expect(safedictionary == [0, 1, 10, 2, 3]) == true
            }
            it("can do insert sequense") {
                let safedictionary: TuringSafeDictionary<Int> = [0, 1, 2, 3]
                safedictionary.insert(contentsOf: [10, 20, 30], at: 3)
                expect(safedictionary.count) == 7
                expect(safedictionary == [0, 1, 2, 10, 20, 30, 3]) == true
            }
            it("can do replce subrange") {
                let safedictionary: TuringSafeDictionary<Int> = [0, 1, 2, 3, 4, 5, 6]
                safedictionary.replaceSubrange(2..<4, with: [10, 20, 30])
                expect(safedictionary.count) == 8
                expect(safedictionary == [0, 1, 10, 20, 30, 4, 5, 6]) == true
            }
            it("can do replce subrange range") {
                let safedictionary: TuringSafeDictionary<Int> = [0, 1, 2, 3, 4, 5, 6]
                let range = Range<Int>.init(uncheckedBounds: (2, 4))
                safedictionary.replaceSubrange(range, with: [10, 20, 30])
                expect(safedictionary.count) == 8
                expect(safedictionary == [0, 1, 10, 20, 30, 4, 5, 6]) == true
            }
            it("can do reverse capacity") {
                let safedictionary: TuringSafeDictionary<Int> = [0, 1, 2, 3, 4, 5, 6]
                safedictionary.reserveCapacity(100)
                expect(safedictionary.capacity) >= 100
            }
            it("can do operand += element") {
                var safedictionary: TuringSafeDictionary<Int> = [0, 1, 2, 3, 4, 5, 6]
                safedictionary += 10
                expect(safedictionary.count) == 8
                expect(safedictionary == [0, 1, 2, 3, 4, 5, 6, 10]) == true
            }
            it("can do operand += dictionary") {
                var safedictionary: TuringSafeDictionary<Int> = [0, 1, 2, 3, 4, 5, 6]
                safedictionary += [10, 20, 30]
                expect(safedictionary.count) == 10
                expect(safedictionary == [0, 1, 2, 3, 4, 5, 6, 10, 20, 30]) == true
            }
        }
    }
}

