//
//  TestTuringSafeDictionaryHasherSpec.swift
//  TuringSafe_Tests
//
//  Created by Dmitry Rybochkin on 16/04/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Quick
import Nimble
import TuringSafeDictionary

final class TestTuringSafeDictionaryHasherSpec: QuickSpec {

    // MARK: - Life cycle

    override func spec() {
        describe("these will success") {
            it("test func hash(into hasher: inout Hasher)") {
                let testDictionary: [String: Int] = ["1": 1, "2": 2, "3": 1, "4": 5, "5": 1, "6": 3]
                let safeDictionary1 = TuringSafeDictionary<String, Int>(dictionary: testDictionary)
                let safeDictionary2 = TuringSafeDictionary<String, Int>(dictionary: testDictionary)
                expect(safeDictionary1.hashValue) == safeDictionary2.hashValue
                let dictionary = ["1": 1, "2": 2, "3": 1, "4": 5, "5": 1, "6": 3]
                expect(safeDictionary1.hashValue) != dictionary.hashValue
            }
        }
    }
}
