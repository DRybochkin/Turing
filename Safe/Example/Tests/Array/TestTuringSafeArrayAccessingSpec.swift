//
//  TestTuringSafeArrayAccessingSpec.swift
//  TuringSafe_Tests
//
//  Created by Dmitry Rybochkin on 16/04/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Quick
import Nimble
import TuringSafe

final class TestTuringSafeArrayAccessingSpec: QuickSpec {

    // MARK: - Life cycle

    override func spec() {
        describe("these will success") {
            it("can do first") {
                let safeArray: TuringSafeArray<Int> = [0, 100, 200]
                expect(safeArray.first) == 0
            }

            it("can do last") {
                let safeArray: TuringSafeArray<Int> = [0, 100, 200]
                expect(safeArray.last) == 200
            }

            it("can do subscript[index]") {
                let safeArray: TuringSafeArray<Int> = [0, 100, 200]
                expect(safeArray[1]) == 100
            }

            it("can do subscript[range]") {
                let safeArray: TuringSafeArray<Int> = [0, 100, 200, 400, 500]
                let newSafeArray = safeArray[1..<3]
                expect(newSafeArray.count) == 2
                expect(newSafeArray == [100, 200]) == true
            }

            it("can do random") {
                let safeArray: TuringSafeArray<Int> = [0, 100, 200]
                if let item = safeArray.randomElement() {
                    expect(safeArray.contains(item)) == true
                } else {
                    expect(1) == 0
                }
            }
        }
    }
}

