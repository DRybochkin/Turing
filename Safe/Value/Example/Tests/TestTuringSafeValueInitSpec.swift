//
//  TestTuringSafeValueInitSpec.swift
//  TuringSafe_Tests
//
//  Created by Dmitry Rybochkin on 16/04/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Quick
import Nimble
import TuringSafeValue

final class TestTuringSafeValueInitSpec: QuickSpec {

    // MARK: - Life cycle

    override func spec() {
        describe("these will success") {
            it("test init(_ value: T, isConcurrent: Bool = true) where T == Int") {
                let safeArray: TuringSafeValue<Int> = TuringSafeValue(101)
                expect(safeArray.value) == 101
                expect(safeArray.value) != 10
                expect(safeArray.value) != 0
            }
            it("test init(_ value: T, isConcurrent: Bool = true) where T == String") {
                let safeArray: TuringSafeValue<String> = TuringSafeValue("101")
                expect(safeArray.value) == "101"
                expect(safeArray.value) != ""
                expect(safeArray.value) != "1"
            }
            it("test init(_ value: T, isConcurrent: Bool = true) where T == struct") {
                let safeArray: TuringSafeValue<TestStruct> = TuringSafeValue(.init(property1: "", property2: 0))
                expect(safeArray.value) == TestStruct(property1: "", property2: 0)
                expect(safeArray.value) != TestStruct(property1: "1", property2: 0)
                expect(safeArray.value) != TestStruct(property1: "", property2: 1)
                expect(safeArray.value) != TestStruct(property1: "1", property2: 1)
            }
            it("test init(_ value: T, isConcurrent: Bool = true) where T == object") {
                let safeArray: TuringSafeValue<TestObject> = TuringSafeValue(.init(property1: "", property2: 0))
                expect(safeArray.value) == TestObject(property1: "", property2: 0)
                expect(safeArray.value) != TestObject(property1: "1", property2: 0)
                expect(safeArray.value) != TestObject(property1: "", property2: 1)
                expect(safeArray.value) != TestObject(property1: "1", property2: 1)
            }
            it("test init(_ value: T, isConcurrent: Bool = true) where T == enum") {
                let safeArray: TuringSafeValue<TestEnum> = TuringSafeValue(.test1)
                expect(safeArray.value) == .test1
                expect(safeArray.value) != .test2
            }
        }
    }
}
