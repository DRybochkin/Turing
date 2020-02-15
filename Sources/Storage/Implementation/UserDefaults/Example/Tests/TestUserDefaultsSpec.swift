//
//  TestUserDefaultsSpec.swift
//  TuringUserDefaultsService_Tests
//
//  Created by Dmitry Rybochkin on 12/06/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation
import Quick
import Nimble
import TuringStorageServiceInterface
import TuringUserDefaultsService

final class TestUserDefaultsSpec: QuickSpec {

    // MARK: - Types

    private enum StorageKey: String, StorageServiceKeyProtocol {
        case testKey1
        case testKey2
        case testKey3
        case testKey4
    }

    // MARK: - Lifecycle

    override func spec() {
        checkString()
        checkInt()
        checkFloatAndDouble()
        checkBool()
        checkData()
        checkDictionary()
        checkArray()
        checkObject()
    }
}

private extension TestUserDefaultsSpec {

    // MARK: - Private functions

    private func strong<T: Codable & Equatable>(testValue: T) {
        it("strong \(String(describing: testValue))") {
            let storageService: StorageServiceProtocol = UserDefaultsService()
            switch storageService.save(value: testValue, for: StorageKey.testKey1) {
            case .success:
                let value = storageService.value(T.self, for: StorageKey.testKey1)
                switch value {
                case .success(let value):
                    expect(value) == testValue
                case .failure(let error):
                    expect(error).to(beNil())
                }
            case .failure(let error):
                expect(error).to(beNil())
            }
            switch storageService.delete(for: StorageKey.testKey1) {
            case .success:
                let value = storageService.value(T.self, for: StorageKey.testKey1)
                switch value {
                case .success(let value):
                    expect(value).to(beNil())
                case .failure(let error):
                    expect(error.description) == "UserDefaultsService.keyNotFound"
                }
            case .failure(let error):
                expect(error).to(beNil())
            }
        }
    }

    private func optional<T: Codable & Equatable>(testValue: T?) {
        it("optional \(String(describing: testValue))") {
            let storageService: StorageServiceProtocol = UserDefaultsService()
            switch storageService.save(value: testValue, for: StorageKey.testKey2) {
            case .success:
                let value = storageService.value(T.self, for: StorageKey.testKey2)
                switch value {
                case .success(let value):
                    expect(value) == testValue
                case .failure(let error):
                    expect(error).to(beNil())
                }
            case .failure(let error):
                if testValue == nil, error.description == "UserDefaultsService.valueIsNil" {
                    expect(true) == true
                } else {
                    print("zzzz \(error.debugDescription)")
                    expect(error).to(beNil())
                }
            }
            switch storageService.delete(for: StorageKey.testKey2) {
            case .success:
                let value = storageService.value(T.self, for: StorageKey.testKey2)
                switch value {
                case .success(let value):
                    expect(value).to(beNil())
                case .failure(let error):
                    expect(error.description) == "UserDefaultsService.keyNotFound"
                }
            case .failure(let error):
                expect(error).to(beNil())
            }
        }
    }

    private func optionalNil<T: Codable & Equatable>(_ type: T.Type) {
        it("nil \(String(describing: type))") {
            let storageService: StorageServiceProtocol = UserDefaultsService()
            let testValue: T? = nil
            switch storageService.save(value: testValue, for: StorageKey.testKey3) {
            case .success(let value):
                expect(value).to(beNil())
            case .failure(let error):
                expect(error.description) == "UserDefaultsService.valueIsNil"
            }
            let value = storageService.value(T.self, for: StorageKey.testKey3)
            switch value {
            case .success(let value):
                expect(value).to(beNil())
            case .failure(let error):
                expect(error.description) == "UserDefaultsService.keyNotFound"
            }
            switch storageService.delete(for: StorageKey.testKey3) {
            case .success:
                let value = storageService.value(T.self, for: StorageKey.testKey3)
                switch value {
                case .success(let value):
                    expect(value).to(beNil())
                case .failure(let error):
                    expect(error.description) == "UserDefaultsService.keyNotFound"
                }
            case .failure(let error):
                expect(error).to(beNil())
            }
        }
    }

    private func unwrapped<T: Codable & Equatable>(testValue: T!) {
        it("unwrapped \(String(describing: testValue))") {
            let storageService: StorageServiceProtocol = UserDefaultsService()
            switch storageService.save(value: testValue, for: StorageKey.testKey4) {
            case .success:
                let value = storageService.value(T.self, for: StorageKey.testKey4)
                switch value {
                case .success(let value):
                    expect(value) == testValue
                case .failure(let error):
                    expect(error).to(beNil())
                }
            case .failure(let error):
                expect(error).to(beNil())
            }
            switch storageService.delete(for: StorageKey.testKey4) {
            case .success:
                let value = storageService.value(T.self, for: StorageKey.testKey4)
                switch value {
                case .success(let value):
                    expect(value).to(beNil())
                case .failure(let error):
                    expect(error.description) == "UserDefaultsService.keyNotFound"
                }
            case .failure(let error):
                expect(error).to(beNil())
            }
        }
    }

    private func checkString() {
        describe("test string") {
            strong(testValue: "testString")
            strong(testValue: "")
            optional(testValue: "testOptionalString")
            optional(testValue: "")
            optionalNil(String.self)
            unwrapped(testValue: "testUnwrappedString")
            unwrapped(testValue: "")
        }
    }

    private func checkInt() {
        describe("test int") {
            strong(testValue: 1)
            strong(testValue: -11)
            strong(testValue: 0)
            optional(testValue: -1)
            optional(testValue: 100)
            optionalNil(Int.self)
            unwrapped(testValue: 300)
            unwrapped(testValue: 200)
        }
    }

    private func checkFloatAndDouble() {
        describe("test float") {
            strong(testValue: Float(1))
            strong(testValue: Float(-11))
            strong(testValue: Float(0))
            strong(testValue: Float(-1.123))
            strong(testValue: Float(20.12345))
            optional(testValue: Float(-11.12345))
            optional(testValue: Float(100))
            optionalNil(Float.self)
            unwrapped(testValue: Float(-10.12345))
            unwrapped(testValue: Float(111))
        }
        describe("test double") {
            strong(testValue: 1.0)
            strong(testValue: -11.0)
            strong(testValue: 0.0)
            strong(testValue: -1.123)
            strong(testValue: 20.12345)
            optional(testValue: -11.12345)
            optional(testValue: 100.0)
            optionalNil(Double.self)
            unwrapped(testValue: -10.12345)
            unwrapped(testValue: 111)
        }
    }

    private func checkBool() {
        describe("test bool") {
            strong(testValue: true)
            strong(testValue: false)
            optional(testValue: true)
            optional(testValue: false)
            optionalNil(Bool.self)
            unwrapped(testValue: true)
            unwrapped(testValue: false)
        }
    }

    private func checkData() {
        describe("test data") {
            strong(testValue: Data("testData".utf8))
            strong(testValue: Data())
            optional(testValue: Data("testData".utf8))
            let value: Data? = nil
            optional(testValue: value)
            optionalNil(Data.self)
            unwrapped(testValue: Data("testData".utf8))
            unwrapped(testValue: Data())
        }
    }

    private func checkDictionary() {
        describe("test dictionary") {
            strong(testValue: ["00": 0, "11": 1, "22": 2, "100": 200])
            strong(testValue: [:] as [String: Int])
            optional(testValue: ["00": 0, "11": 1, "22": 2, "100": 200])
            optional(testValue: [:] as [String: Int])
            optionalNil([String].self)
            unwrapped(testValue: ["00": 0, "11": 1, "22": 2, "100": 200])
            unwrapped(testValue: [:] as [String: Int])
        }
    }

    private func checkObject() {
        describe("test custom object") {
            let testObject = TestCustomObject(testString: "testString",
                                              testInt: 10,
                                              testDouble: 1,
                                              testArray: ["1", "234"],
                                              testDistionary: ["sdsd": 123, "gfgfg": 34])
            strong(testValue: [testObject, testObject, testObject])
            strong(testValue: ["1": testObject, "we": testObject])
            optional(testValue: testObject)
            optionalNil(TestCustomObject.self)
            unwrapped(testValue: testObject)
        }
    }

    private func checkArray() {
        describe("test string array") {
            strong(testValue: ["", "1", "2", "wwww"])
            strong(testValue: [] as [String])
            optional(testValue: ["", "1", "2", "wwww"])
            optional(testValue: [] as [String])
            optionalNil([String].self)
            unwrapped(testValue: ["", "1", "2", "wwww"])
            unwrapped(testValue: [] as [String])
        }

        describe("test int array") {
            strong(testValue: [0, 1, 2, 200])
            strong(testValue: [] as [Int])
            optional(testValue: [0, 1, 2, 200])
            optional(testValue: [] as [Int])
            optionalNil([String].self)
            unwrapped(testValue: [0, 1, 2, 200])
            unwrapped(testValue: [] as [Int])
        }
    }
}

private extension TestUserDefaultsSpec {

    // MARK: - Types

    private struct TestCustomObject: Codable, Equatable {
        var testString: String
        var testInt: Int
        var testDouble: Double
        var testArray: [String]
        var testDistionary: [String: Int]
    }
}
