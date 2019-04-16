//
//  TestTuringSafeDictionaryRemovingSpec.swift
//  TuringSafe_Tests
//
//  Created by Dmitry Rybochkin on 16/04/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Quick
import Nimble
import TuringSafe

final class TestTuringSafeDictionaryRemovingSpec: QuickSpec {

    // MARK: - Life cycle

    override func spec() {
        describe("these will success") {
            it("can do remove at index") {
                let safedictionary: TuringSafeDictionary<Int> = [0, 100, 200]
                safedictionary.remove(at: 1)
                expect(safedictionary == [0, 200]) == true
            }
            it("can do remove first") {
                let safedictionary: TuringSafeDictionary<Int> = [0, 100, 200]
                safedictionary.removeFirst()
                expect(safedictionary == [100, 200]) == true
            }
            it("can do remove first count") {
                let safedictionary: TuringSafeDictionary<Int> = [0, 100, 200]
                safedictionary.removeFirst(2)
                expect(safedictionary == [200]) == true
            }
            it("can do remove last") {
                let safedictionary: TuringSafeDictionary<Int> = [0, 100, 200]
                safedictionary.removeLast()
                expect(safedictionary == [0, 100]) == true
            }
            it("can do remove last count") {
                let safedictionary: TuringSafeDictionary<Int> = [0, 100, 200]
                safedictionary.removeLast(2)
                expect(safedictionary == [0]) == true
            }
            it("can do remove subrange") {
                let safedictionary: TuringSafeDictionary<Int> = [0, 1, 2, 3, 4, 5, 6]
                safedictionary.removeSubrange(2..<4)
                expect(safedictionary.count) == 5
                expect(safedictionary == [0, 1, 4, 5, 6]) == true
            }
            it("can do remove subrange range") {
                let safedictionary: TuringSafeDictionary<Int> = [0, 1, 2, 3, 4, 5, 6]
                let range = Range<Int>.init(uncheckedBounds: (2, 4))
                safedictionary.removeSubrange(range)
                expect(safedictionary.count) == 5
                expect(safedictionary == [0, 1, 4, 5, 6]) == true
            }
            it("can do remove all") {
                let safedictionary: TuringSafeDictionary<Int> = [0, 100, 200]
                safedictionary.removeAll()
                expect(safedictionary.isEmpty) == true
            }
            it("can do remove all where") {
                let safedictionary: TuringSafeDictionary<Int> = [0, 100, 200]
                safedictionary.removeAll(where: { $0 == 100 })
                expect(safedictionary == [0, 200]) == true
            }
            it("can do remove last keepingCapacity: true") {
                let safedictionary: TuringSafeDictionary<Int> = [0, 100, 200]
                safedictionary.removeAll(keepingCapacity: true)
                expect(safedictionary.isEmpty) == true
            }
            it("can do remove last keepingCapacity: false") {
                let safedictionary: TuringSafeDictionary<Int> = [0, 100, 200]
                safedictionary.removeAll(keepingCapacity: false)
                expect(safedictionary.isEmpty) == true
            }
            it("can do pop last") {
                let safedictionary: TuringSafeDictionary<Int> = [0, 100, 200]
                let lastItem = safedictionary.popLast()
                expect(lastItem) == 200
                expect(safedictionary == [0, 100]) == true
            }
        }
    }
}

