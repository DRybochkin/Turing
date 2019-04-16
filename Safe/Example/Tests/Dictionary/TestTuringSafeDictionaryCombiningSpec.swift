//
//  TestTuringSafeDictionaryCombiningSpec.swift
//  TuringSafe_Tests
//
//  Created by Dmitry Rybochkin on 16/04/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Quick
import Nimble
import TuringSafe

final class TestTuringSafeDictionaryCombiningSpec: QuickSpec {

    // MARK: - Life cycle

    override func spec() {
        describe("these will success") {
            it("can do append sequence") {
                let safedictionary: TuringSafeDictionary<Int> = [1, 2, 3]
                safedictionary.append(contentsOf: [10, 20, 30])
                expect(safedictionary.count) == 6
                expect(safedictionary == [1, 2, 3, 10, 20, 30]) == true
            }
            it("can do operator sequence + safe dictionary") {
                let dictionary: [Int] = [10, 20, 30]
                let safedictionary: TuringSafeDictionary<Int> = [1, 2, 3]
                let newdictionary: [Int] = dictionary + safedictionary
                expect(newdictionary.count) == 6
                expect(newdictionary == [10, 20, 30, 1, 2, 3]) == true
            }
            it("can do operator safe dictionary + sequence") {
                let dictionary: [Int] = [10, 20, 30]
                let safedictionary: TuringSafeDictionary<Int> = [1, 2, 3]
                let newdictionary: TuringSafeDictionary<Int> = safedictionary + dictionary
                expect(newdictionary.count) == 6
                expect(newdictionary == [1, 2, 3, 10, 20, 30]) == true
            }
            it("can do operator safe dictionary += sequence") {
                var dictionary: [Int] = [10, 20, 30]
                let safedictionary: TuringSafeDictionary<Int> = [1, 2, 3]
                dictionary += safedictionary
                expect(dictionary.count) == 6
                expect(dictionary == [10, 20, 30, 1, 2, 3]) == true
            }
            it("can do operator safe sequence + dictionary") {
                let dictionary: [Int] = [10, 20, 30]
                var safedictionary: TuringSafeDictionary<Int> = [1, 2, 3]
                safedictionary += dictionary
                expect(safedictionary.count) == 6
                expect(safedictionary == [1, 2, 3, 10, 20, 30]) == true
            }
        }
    }
}
