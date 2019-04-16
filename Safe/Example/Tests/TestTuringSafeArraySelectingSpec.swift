//
//  TestTuringSafeArraySelectingSpec.swift
//  TuringSafe_Tests
//
//  Created by Dmitry Rybochkin on 16/04/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Quick
import Nimble
import TuringSafe

final class TestTuringSafeArraySelectingSpec: QuickSpec {

    // MARK: - Life cycle

    override func spec() {
        describe("these will success") {
            it("can do filter") {
                let safeArray: TuringSafeArray<Int> = [1, 2, 1, 5, 1, 3]
                expect(safeArray.filter({ $0 == 1 }) == [1, 1, 1]) == true
            }
            it("can do prefix max length") {
                let safeArray: TuringSafeArray<Int> = [1, 2, 1, 5, 1, 3]
                expect(safeArray.prefix(3) == [1, 2, 1]) == true
            }
            it("can do prefix through") {
                let safeArray: TuringSafeArray<Int> = [1, 2, 1, 5, 1, 3]
                expect(safeArray.prefix(through: 3) == [1, 2, 1, 5]) == true
            }
            it("can do prefix upTo") {
                let safeArray: TuringSafeArray<Int> = [1, 2, 1, 5, 1, 3]
                expect(safeArray.prefix(upTo: 3) == [1, 2, 1]) == true
            }
            it("can do prefix while") {
                let safeArray: TuringSafeArray<Int> = [1, 2, 1, 5, 1, 3]
                expect(safeArray.prefix(while: { $0 < 5 }) == [1, 2, 1]) == true
            }
            it("can do suffix max length") {
                let safeArray: TuringSafeArray<Int> = [1, 2, 1, 5, 1, 3]
                expect(safeArray.suffix(3) == [5, 1, 3]) == true
            }
            it("can do suffix from") {
                let safeArray: TuringSafeArray<Int> = [1, 2, 1, 5, 1, 3]
                expect(safeArray.suffix(from: 3) == [5, 1, 3]) == true
            }
        }
    }
}

