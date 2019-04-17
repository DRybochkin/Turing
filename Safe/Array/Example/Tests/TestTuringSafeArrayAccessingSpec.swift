//
//  TestTuringSafeArrayAccessingSpec.swift
//  TuringSafe_Tests
//
//  Created by Dmitry Rybochkin on 16/04/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Quick
import Nimble
import TuringSafeArray

final class TestTuringSafeArrayAccessingSpec: QuickSpec {

    // MARK: - Life cycle

    override func spec() {
        describe("these will success") {
            it("test var first: Element?") {
                let safeArray: TuringSafeArray<Int> = [0, 100, 200]
                expect(safeArray.first) == 0
            }

            it("test var last: Element?") {
                let safeArray: TuringSafeArray<Int> = [0, 100, 200]
                expect(safeArray.last) == 200
            }

            it("test subscript(position: Index) -> Element") {
                let safeArray: TuringSafeArray<Int> = [0, 100, 200]
                expect(safeArray[1]) == 100
            }

            it("test subscript(bounds: Range<Index>) -> TuringSafeArray<Element>") {
                let safeArray: TuringSafeArray<Int> = [0, 100, 200, 400, 500]
                let newSafeArray = safeArray[1..<3]
                expect(newSafeArray.count) == 2
                expect(newSafeArray == [100, 200]) == true
            }

            it("test func randomElement() -> Element?") {
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

