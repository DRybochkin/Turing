//
//  TestTuringSafeArrayCodableSpec.swift
//  TuringSafe_Tests
//
//  Created by Dmitry Rybochkin on 16/04/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Quick
import Nimble
import TuringSafeArray

final class TestTuringSafeArrayCodableSpec: QuickSpec {

    // MARK: - Life cycle

    override func spec() {
        describe("these will success") {
            it("test init(from decoder: Decoder) throws") {
                let jsonString = "[1, 2, 1, 5, 1, 3]"
                if let data = jsonString.data(using: .utf8), let safeArray = try? JSONDecoder().decode(TuringSafeArray<Int>.self, from: data) {
                    expect(safeArray == [1, 2, 1, 5, 1, 3]) == true
                } else {
                    expect(1) == 0
                }
            }
            it("test func encode(to encoder: Encoder) throws") {
                let safeArray: TuringSafeArray<Int> = [1, 2, 1, 5, 1, 3]
                if let data = try? JSONEncoder().encode(safeArray), let jsonString: String = String(data: data, encoding: .utf8) {
                    expect(jsonString.replacingOccurrences(of: " ", with: "")) == "[1,2,1,5,1,3]"
               } else {
                    expect(1) == 0
                }
            }
        }
    }
}
