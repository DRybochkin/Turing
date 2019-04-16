//
//  TestTuringSafeDictionaryFindingSpec.swift
//  TuringSafe_Tests
//
//  Created by Dmitry Rybochkin on 16/04/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Quick
import Nimble
import TuringSafe

final class TestTuringSafeDictionaryFindingSpec: QuickSpec {

    // MARK: - Life cycle

    override func spec() {
        describe("these will success") {
            it("can do contains element") {
                let safedictionary: TuringSafeDictionary<Int> = [1, 2, 3]
                expect(safedictionary.contains(2)) == true
                expect(safedictionary.contains(20)) == false
            }
            it("can do contains where") {
                let safedictionary: TuringSafeDictionary<Int> = [1, 2, 3]
                expect(safedictionary.contains(where: { $0 > 0 })) == true
                expect(safedictionary.contains(where: { $0 <= 0 })) == false
            }
            it("can do allSatisfy") {
                let safedictionary: TuringSafeDictionary<Int> = [1, 2, 3]
                expect(safedictionary.allSatisfy({ $0 > 0 })) == true
                expect(safedictionary.allSatisfy({ $0 > 1 })) == false
            }
            it("can do first where") {
                let safedictionary: TuringSafeDictionary<Int> = [1, 2, 3, 4]
                expect(safedictionary.first(where: { $0 > 2 })) == 3
                expect(safedictionary.first(where: { $0 >= 2 })) == 2
                expect(safedictionary.first(where: { $0 >= 20 })).to(beNil())
            }
            it("can do first index of") {
                let safedictionary: TuringSafeDictionary<Int> = [1, 2, 1, 2, 1, 3]
                expect(safedictionary.firstIndex(of: 2)) == 1
                expect(safedictionary.firstIndex(of: 0)).to(beNil())
            }
            it("can do first index where") {
                let safedictionary: TuringSafeDictionary<Int> = [3, 2, 1, 2, 1, 3]
                expect(safedictionary.firstIndex(where: { $0 == 1 })) == 2
                expect(safedictionary.firstIndex(where: { $0 == 20 })).to(beNil())
            }
            it("can do last where") {
                let safedictionary: TuringSafeDictionary<Int> = [1, 2, 3, 4]
                expect(safedictionary.last(where: { $0 > 2 })) == 4
                expect(safedictionary.last(where: { $0 <= 2 })) == 2
                expect(safedictionary.last(where: { $0 >= 20 })).to(beNil())
            }
            it("can do last index of") {
                let safedictionary: TuringSafeDictionary<Int> = [1, 2, 1, 3]
                expect(safedictionary.lastIndex(of: 1)) == 2
                expect(safedictionary.lastIndex(of: 0)).to(beNil())
            }
            it("can do last index where") {
                let safedictionary: TuringSafeDictionary<Int> = [1, 2, 3, 2, 3]
                expect(safedictionary.lastIndex(where: { $0 == 2 })) == 3
                expect(safedictionary.lastIndex(where: { $0 == 20 })).to(beNil())
            }
            it("can do min") {
                let safedictionary: TuringSafeDictionary<Int> = [1, 2, 1, 3]
                expect(safedictionary.min()) == 1
            }
            it("can do max") {
                let safedictionary: TuringSafeDictionary<Int> = [1, 2, 1, 3]
                expect(safedictionary.max()) == 3
            }
            it("can do min by") {
                let safedictionary: TuringSafeDictionary<Int> = [1, 2, 1, 3]
                expect(safedictionary.min(by: { $0 > $1 })) == 3
            }
            it("can do max by") {
                let safedictionary: TuringSafeDictionary<Int> = [1, 2, 1, 3]
                expect(safedictionary.max(by: { $0 < $1 })) == 3
            }
        }
    }
}

