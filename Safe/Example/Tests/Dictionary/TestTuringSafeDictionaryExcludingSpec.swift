//
//  TestTuringSafeDictionaryExcludingSpec.swift
//  TuringSafe_Tests
//
//  Created by Dmitry Rybochkin on 16/04/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Quick
import Nimble
import TuringSafe

final class TestTuringSafeDictionaryExcludingSpec: QuickSpec {

    // MARK: - Life cycle

    override func spec() {
        describe("these will success") {
            it("can do dropFirst") {
                let safedictionary: TuringSafeDictionary<Int> = [1, 2, 1, 5, 1, 3]
                let dropped = safedictionary.dropFirst(3)
                expect(dropped == [5, 1, 3]) == true
                expect(safedictionary == [1, 2, 1, 5, 1, 3]) == true
            }
            it("can do dropLast") {
                let safedictionary: TuringSafeDictionary<Int> = [1, 2, 1, 5, 1, 3]
                let dropped = safedictionary.dropLast(3)
                expect(dropped == [1, 2, 1]) == true
                expect(safedictionary == [1, 2, 1, 5, 1, 3]) == true
            }
            it("can do drop while") {
                let safedictionary: TuringSafeDictionary<Int> = [1, 2, 1, 5, 1, 3]
                let dropped = safedictionary.drop(while: { $0 < 5 })
                expect(dropped == [5, 1, 3]) == true
                expect(safedictionary == [1, 2, 1, 5, 1, 3]) == true
            }
        }
    }
}
