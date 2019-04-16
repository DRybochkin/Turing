//
//  TestTuringSafeDictionarySelectingSpec.swift
//  TuringSafe_Tests
//
//  Created by Dmitry Rybochkin on 16/04/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Quick
import Nimble
import TuringSafe

final class TestTuringSafeDictionarySelectingSpec: QuickSpec {

    // MARK: - Life cycle

    override func spec() {
        describe("these will success") {
            it("can do filter") {
                let safedictionary: TuringSafeDictionary<Int> = [1, 2, 1, 5, 1, 3]
                expect(safedictionary.filter({ $0 == 1 }) == [1, 1, 1]) == true
            }
            it("can do prefix max length") {
                let safedictionary: TuringSafeDictionary<Int> = [1, 2, 1, 5, 1, 3]
                expect(safedictionary.prefix(3) == [1, 2, 1]) == true
            }
            it("can do prefix through") {
                let safedictionary: TuringSafeDictionary<Int> = [1, 2, 1, 5, 1, 3]
                expect(safedictionary.prefix(through: 3) == [1, 2, 1, 5]) == true
            }
            it("can do prefix upTo") {
                let safedictionary: TuringSafeDictionary<Int> = [1, 2, 1, 5, 1, 3]
                expect(safedictionary.prefix(upTo: 3) == [1, 2, 1]) == true
            }
            it("can do prefix while") {
                let safedictionary: TuringSafeDictionary<Int> = [1, 2, 1, 5, 1, 3]
                expect(safedictionary.prefix(while: { $0 < 5 }) == [1, 2, 1]) == true
            }
            it("can do suffix max length") {
                let safedictionary: TuringSafeDictionary<Int> = [1, 2, 1, 5, 1, 3]
                expect(safedictionary.suffix(3) == [5, 1, 3]) == true
            }
            it("can do suffix from") {
                let safedictionary: TuringSafeDictionary<Int> = [1, 2, 1, 5, 1, 3]
                expect(safedictionary.suffix(from: 3) == [5, 1, 3]) == true
            }
        }
    }
}

