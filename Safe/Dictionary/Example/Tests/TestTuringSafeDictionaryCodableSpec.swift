//
//  TestTuringSafeDictionaryCodableSpec.swift
//  TuringSafe_Tests
//
//  Created by Dmitry Rybochkin on 16/04/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Quick
import Nimble
import TuringSafeDictionary

final class TestTuringSafeDictionaryCodableSpec: QuickSpec {

    // MARK: - Life cycle

    override func spec() {
        describe("these will success") {
            it("test init(from decoder: Decoder) throws") {
                let safeDictionary: TuringSafeDictionary<String, Int> = ["1": 1, "2": 2, "3": 1, "4": 5, "5": 1, "6": 3]
                let jsonString = "{ \"1\": 1, \"2\": 2, \"3\": 1, \"4\": 5, \"5\": 1, \"6\": 3}"
                if let data = jsonString.data(using: .utf8), let decodedSafeDictionary = try? JSONDecoder().decode(TuringSafeDictionary<String, Int>.self, from: data) {
                    expect(safeDictionary == decodedSafeDictionary) == true
                } else {
                    expect(1) == 0
                }
            }
            it("test func encode(to encoder: Encoder) throws") {
                let safeDictionary: TuringSafeDictionary<String, Int> = ["1": 1, "2": 2, "3": 1, "4": 5, "5": 1, "6": 3]
                guard let data = try? JSONEncoder().encode(safeDictionary), let jsonString: String = String(data: data, encoding: .utf8) else {
                    expect(1) == 0
                    return
                }
                if let data = jsonString.data(using: .utf8), let decodedSafeDictionary = try? JSONDecoder().decode(TuringSafeDictionary<String, Int>.self, from: data) {
                    expect(safeDictionary == decodedSafeDictionary) == true
                } else {
                    expect(1) == 0
                }
            }
        }
    }
}
