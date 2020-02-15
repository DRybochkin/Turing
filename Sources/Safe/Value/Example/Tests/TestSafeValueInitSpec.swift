//
//  TestSafeValueInitSpec.swift
//  TuringSafeValue_Tests
//
//  Created by Dmitry Rybochkin on 16/04/2019.
//  Copyright (c) 2019 Dmitry Rybochkin. All rights reserved.
//

import Quick
import Nimble
import TuringSafeValue

final class TestSafeValueInitSpec: QuickSpec {

    // MARK: - Life cycle

    override func spec() {
        describe("these will success") {
            it("test init(_ value: T, isConcurrent: Bool = true) where T == Int") {
                let safeArray: SafeValue<Int> = SafeValue(101)
                expect(safeArray.value) == 101
                expect(safeArray.value) != 10
                expect(safeArray.value) != 0
            }
            it("test init(_ value: T, isConcurrent: Bool = true) where T == String") {
                let safeArray: SafeValue<String> = SafeValue("101")
                expect(safeArray.value) == "101"
                expect(safeArray.value) != ""
                expect(safeArray.value) != "1"
            }
            it("test init(_ value: T, isConcurrent: Bool = true) where T == struct") {
                let safeArray: SafeValue<TestStruct> = SafeValue(.init(property1: "", property2: 0))
                expect(safeArray.value) == TestStruct(property1: "", property2: 0)
                expect(safeArray.value) != TestStruct(property1: "1", property2: 0)
                expect(safeArray.value) != TestStruct(property1: "", property2: 1)
                expect(safeArray.value) != TestStruct(property1: "1", property2: 1)
            }
            it("test init(_ value: T, isConcurrent: Bool = true) where T == object") {
                let safeArray: SafeValue<TestObject> = SafeValue(.init(property1: "", property2: 0))
                expect(safeArray.value) == TestObject(property1: "", property2: 0)
                expect(safeArray.value) != TestObject(property1: "1", property2: 0)
                expect(safeArray.value) != TestObject(property1: "", property2: 1)
                expect(safeArray.value) != TestObject(property1: "1", property2: 1)
            }
            it("test init(_ value: T, isConcurrent: Bool = true) where T == enum") {
                let safeArray: SafeValue<TestEnum> = SafeValue(.test1)
                expect(safeArray.value) == .test1
                expect(safeArray.value) != .test2
            }
        }
    }
}
