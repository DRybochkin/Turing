//
//  TestAnyRecursiveSpec.swift
//  TuringAnyRecursive_Tests
//
//  Created by Dmitry Rybochkin on 11/06/2019.
//  Copyright © 2019 Dmitry Rybochkin. All rights reserved.
//

import Quick
import Nimble
import TuringAnyRecursive

final class TestAnyRecursiveSpec: QuickSpec {

    // MARK: - Lifecycle

    override func spec() {
        describe("these will success") {
            decode()
        }
    }
}

private extension TestAnyRecursiveSpec {

    // MARK: - Private functions

    private func decode() {
        it("test decode") {
            let jsonString = """
                {
                    "login": "DRybochkin",
                    "id": 5586021.5,
                    "confirmed": true,
                    "testNull": null,
                    "testArray": ["1", "2", "3"],
                    "testObject": { "id": 123, "name": "object name" }
                }
            """

            guard let object = try? JSONDecoder().decode(AnyRecursive.self, from: Data(jsonString.utf8)) else {
                expect(false) == true
                return
            }
            guard case let .object(dictionary) = object else {
                expect(false) == true
                return
            }
            expect(self.checkObjectProperty(dictionary: dictionary, key: "login", value: "DRybochkin")) == true
            expect(self.checkObjectProperty(dictionary: dictionary, key: "id", value: Float(5586021.5))) == true
            expect(self.checkObjectProperty(dictionary: dictionary, key: "confirmed", value: true)) == true
            let testNil: String? = nil
            expect(self.checkObjectProperty(dictionary: dictionary, key: "testNull", value: testNil)) == true
            switch dictionary["testArray"] ?? .null {
            case .array(let array):
                expect(self.check(array: array, value: ["1", "2", "3"])) == true
            default:
                expect(false) == true
            }
            switch dictionary["testObject"] ?? .null {
            case .object(let object):
                expect(self.checkObjectProperty(dictionary: object, key: "name", value: "object name")) == true
                expect(self.checkObjectProperty(dictionary: object, key: "id", value: Float(123))) == true
            default:
                expect(false) == true
            }
        }
    }
}

private extension TestAnyRecursiveSpec {

    // MARK: - Private functions

    private func checkObjectProperty<T: Equatable>(dictionary: [String: AnyRecursive],
                                                   key: String,
                                                   value baseValue: T? = nil) -> Bool {
        guard let login = dictionary[key] else {
            return false
        }
        switch login {
        case .string(let value):
            return value == baseValue as? String
        case .bool(let value):
            return value == baseValue as? Bool
        case .number(let value):
            return value == baseValue as? Float
        case .null:
            return baseValue == nil
        default:
            return false
        }
    }

    private func check<T: Equatable>(array: [AnyRecursive], value baseValue: [T]) -> Bool {
        guard array.count == baseValue.count else {
            return false
        }
        var result: Bool = true
        array.enumerated().forEach({
            switch $0.element {
            case .string(let value):
                result = result && (value == baseValue[$0.offset] as? String)
            case .bool(let value):
                result = result && (value == baseValue[$0.offset] as? Bool)
            case .number(let value):
                result = result && (value == baseValue[$0.offset] as? Float)
            default:
                result = false
            }
        })
        return result
    }
}
