//
//  TestTuringSafeDictionaryHasherSpec.swift
//  TuringSafe_Tests
//
//  Created by Dmitry Rybochkin on 16/04/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Quick
import Nimble
import TuringSafe

final class TestTuringSafeDictionaryHasherSpec: QuickSpec {

    // MARK: - Life cycle

    override func spec() {
        describe("these will success") {
            it("can do hash equals") {
                let safedictionary1: TuringSafeDictionary<Int> = [1, 2, 1, 5, 1, 3]
                let safedictionary2: TuringSafeDictionary<Int> = [1, 2, 1, 5, 1, 3]
                expect(safedictionary1.hashValue) == safedictionary2.hashValue
            }
            it("can do hash not equals") {
                let dictionary = [1, 2, 1, 5, 1, 3]
                let safedictionary: TuringSafeDictionary<Int> = [1, 2, 1, 5, 1, 3]
                expect(safedictionary.hashValue) != dictionary.hashValue
            }
        }
    }
}
