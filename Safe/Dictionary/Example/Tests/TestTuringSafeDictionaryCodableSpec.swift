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

    // MARK: - Types

    typealias SafeDictionary = TuringSafeDictionary<String, Int>

    // MARK: - Life cycle

    override func spec() {
        describe("these will success") {
            it("test init(from decoder: Decoder) throws") {
                let safeDictionary: TuringSafeDictionary<String, Int> = ["1": 1, "2": 2, "3": 1, "4": 5, "5": 1, "6": 3]
                let jsonString = "{ \"1\": 1, \"2\": 2, \"3\": 1, \"4\": 5, \"5\": 1, \"6\": 3}"
                guard let data = jsonString.data(using: .utf8) else {
                    expect("string to data") == "fail"
                    return
                }
                guard let decodedSafeDictionary = try? JSONDecoder().decode(SafeDictionary.self, from: data) else {
                    expect("decode from data") == "fail"
                    return
                }
                expect(safeDictionary == decodedSafeDictionary) == true
            }
            it("test func encode(to encoder: Encoder) throws") {
                let safeDictionary: TuringSafeDictionary<String, Int> = ["1": 1, "2": 2, "3": 1, "4": 5, "5": 1, "6": 3]
                guard let data = try? JSONEncoder().encode(safeDictionary) else {
                    expect("encode to data") == "fail"
                    return
                }
                guard let jsonString: String = String(data: data, encoding: .utf8) else {
                    expect("data to string") == "fail"
                    return
                }
                guard let newData = jsonString.data(using: .utf8) else {
                    expect("string to data") == "fail"
                    return
                }
                guard let decodedSafeDictionary = try? JSONDecoder().decode(SafeDictionary.self, from: newData) else {
                    expect("decode from data") == "fail"
                    return
                }
                expect(safeDictionary == decodedSafeDictionary) == true
            }
        }
    }
}
