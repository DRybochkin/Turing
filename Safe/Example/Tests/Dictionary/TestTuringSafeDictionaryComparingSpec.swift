//
//  TestTuringSafeDictionaryComparingSpec.swift
//  TuringSafe_Tests
//
//  Created by Dmitry Rybochkin on 16/04/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Quick
import Nimble
import TuringSafe

final class TestTuringSafeDictionaryComparingSpec: QuickSpec {

    // MARK: - Life cycle

    override func spec() {
        describe("these will success") {
            it("can do operator safe dictionary == safe dictionary") {
                let safedictionary1: TuringSafeDictionary<Int> = [1, 2, 1, 5, 1, 3]
                let safedictionary2: TuringSafeDictionary<Int> = [1, 2, 1, 5, 1, 3]
                expect(safedictionary1 == safedictionary2) == true
                let safedictionary3: TuringSafeDictionary<Int> = [1, 2]
                expect(safedictionary1 == safedictionary3) == false
            }
            it("can do operator safe dictionary != safe dictionary") {
                let safedictionary1: TuringSafeDictionary<Int> = [1, 2, 1, 5, 1, 3]
                let safedictionary2: TuringSafeDictionary<Int> = [1, 2, 1, 5, 1, 3]
                expect(safedictionary1 != safedictionary2) == false
                let safedictionary3: TuringSafeDictionary<Int> = [1, 2]
                expect(safedictionary1 != safedictionary3) == true
            }
        }
    }
}
