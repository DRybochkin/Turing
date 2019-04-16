//
//  TestTuringSafeDictionaryAccessingSpec.swift
//  TuringSafe_Tests
//
//  Created by Dmitry Rybochkin on 16/04/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Quick
import Nimble
import TuringSafe

final class TestTuringSafeDictionaryAccessingSpec: QuickSpec {

    // MARK: - Life cycle

    override func spec() {
        describe("these will success") {
            it("can do first") {
                let safedictionary: TuringSafeDictionary<Int> = [0, 100, 200]
                expect(safedictionary.first) == 0
            }

            it("can do last") {
                let safedictionary: TuringSafeDictionary<Int> = [0, 100, 200]
                expect(safedictionary.last) == 200
            }

            it("can do subscript[index]") {
                let safedictionary: TuringSafeDictionary<Int> = [0, 100, 200]
                expect(safedictionary[1]) == 100
            }

            it("can do subscript[range]") {
                let safedictionary: TuringSafeDictionary<Int> = [0, 100, 200, 400, 500]
                let newSafedictionary = safedictionary[1..<3]
                expect(newSafedictionary.count) == 2
                expect(newSafedictionary == [100, 200]) == true
            }

            it("can do random") {
                let safedictionary: TuringSafeDictionary<Int> = [0, 100, 200]
                if let item = safedictionary.randomElement() {
                    expect(safedictionary.contains(item)) == true
                } else {
                    expect(1) == 0
                }
            }
        }
    }
}

