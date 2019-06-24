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
                guard let data = jsonString.data(using: .utf8) else {
                    expect("data from string") == "fail"
                    return
                }
                guard let safeArray = try? JSONDecoder().decode(TuringSafeArray<Int>.self, from: data) else {
                    expect("decode from data") == "fail"
                    return
                }
                expect(safeArray == [1, 2, 1, 5, 1, 3]) == true
            }
            it("test func encode(to encoder: Encoder) throws") {
                let safeArray: TuringSafeArray<Int> = [1, 2, 1, 5, 1, 3]
                guard let data = try? JSONEncoder().encode(safeArray) else {
                    expect("encode to data") == "fail"
                    return
                }
                guard let jsonString: String = String(data: data, encoding: .utf8) else {
                    expect("encode from data") == "fail"
                    return
                }
                expect(jsonString.replacingOccurrences(of: " ", with: "")) == "[1,2,1,5,1,3]"
            }
        }
    }
}
