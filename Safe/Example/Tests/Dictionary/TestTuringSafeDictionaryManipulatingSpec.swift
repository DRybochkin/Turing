//
//  TestTuringSafeDictionaryManipulatingSpec.swift
//  TuringSafe_Tests
//
//  Created by Dmitry Rybochkin on 16/04/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Quick
import Nimble
import TuringSafe

final class TestTuringSafeDictionaryManipulatingSpec: QuickSpec {

    // MARK: - Life cycle

    override func spec() {
        describe("these will success") {
            it("can do indices") {
                let safedictionary: TuringSafeDictionary<Int> = [1, 2, 1, 5, 1, 3]
                expect(safedictionary.indices == 0..<6) == true
            }
            it("can do startIndex") {
                let safedictionary: TuringSafeDictionary<Int> = [1, 2, 1, 5, 1, 3]
                expect(safedictionary.startIndex) == 0
            }
            it("can do endIndex") {
                let safedictionary: TuringSafeDictionary<Int> = [1, 2, 1, 5, 1, 3]
                expect(safedictionary.endIndex) == 6
            }
            it("can do index after") {
                let safedictionary: TuringSafeDictionary<Int> = [1, 2, 1, 5, 1, 3]
                expect(safedictionary.index(after: 0)) == 1
            }
            it("can do index before") {
                let safedictionary: TuringSafeDictionary<Int> = [1, 2, 1, 5, 1, 3]
                expect(safedictionary.index(before: 2)) == 1
            }
            it("can do index offsetBy") {
                let safedictionary: TuringSafeDictionary<Int> = [1, 2, 1, 5, 1, 3]
                expect(safedictionary.index(0, offsetBy: 2)) == 2
            }
            it("can do index offsetBy limitedBy") {
                let safedictionary: TuringSafeDictionary<Int> = [1, 2, 1, 5, 1, 3]
                expect(safedictionary.index(0, offsetBy: 2, limitedBy: 10)) == 2
                expect(safedictionary.index(0, offsetBy: 2, limitedBy: 1)).to(beNil())
            }
            it("can do index formIndex after") {
                let safedictionary: TuringSafeDictionary<Int> = [1, 2, 1, 5, 1, 3]
                var index: Int = 0
                safedictionary.formIndex(after: &index)
                expect(index) == 1
            }
            it("can do index formIndex before") {
                let safedictionary: TuringSafeDictionary<Int> = [1, 2, 1, 5, 1, 3]
                var index: Int = 2
                safedictionary.formIndex(before: &index)
                expect(index) == 1
            }
            it("can do index distance") {
                let safedictionary: TuringSafeDictionary<Int> = [1, 2, 1, 5, 1, 3]
                expect(safedictionary.distance(from: 1, to: 3)) == 2
            }
        }
    }
}
