//
//  TestTuringSafeDictionaryCodableSpec.swift
//  TuringSafe_Tests
//
//  Created by Dmitry Rybochkin on 16/04/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Quick
import Nimble
import TuringSafe

final class TestTuringSafeDictionaryCodableSpec: QuickSpec {

    // MARK: - Life cycle

    override func spec() {
        describe("these will success") {
            it("can do decoder") {
                let jsonString = "[1, 2, 1, 5, 1, 3]"
                if let data = jsonString.data(using: .utf8), let safedictionary = try? JSONDecoder().decode(TuringSafeDictionary<Int>.self, from: data) {
                    expect(safedictionary == [1, 2, 1, 5, 1, 3]) == true
                } else {
                    expect(1) == 0
                }
            }
            it("can do encoder") {
                let safedictionary: TuringSafeDictionary<Int> = [1, 2, 1, 5, 1, 3]
                if let data = try? JSONEncoder().encode(safedictionary), let jsonString: String = String(data: data, encoding: .utf8) {
                    expect(jsonString.replacingOccurrences(of: " ", with: "")) == "[1,2,1,5,1,3]"
               } else {
                    expect(1) == 0
                }
            }
        }
    }
}
