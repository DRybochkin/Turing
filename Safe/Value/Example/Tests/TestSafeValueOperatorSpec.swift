//
//  TestSafeValueOperatorSpec.swift
//  TuringSafeValue_Tests
//
//  Created by Dmitry Rybochkin on 17/04/2019.
//  Copyright (c) 2019 Dmitry Rybochkin. All rights reserved.
//

import Quick
import Nimble
import TuringSafeValue

final class TestSafeValueOperatorSpec: QuickSpec {

    // MARK: - Life cycle

    override func spec() {
        describe("these will success") {
            it("test func <-<T>(lhs: SafeValue<T>, rhs: T)") {
                let safeValue = §10
                safeValue <- 20
                expect(§safeValue) == 20
                expect(§safeValue) != 10
            }
            it("test func <-<T>(lhs: inout T, rhs: SafeValue<T>)") {
                let safeValue = §20
                var intValue = 10
                intValue <- safeValue
                expect(intValue) == 20
                expect(intValue) != 10
            }
            it("test func <-<T>(lhs: SafeValue<T>, rhs: @escaping SafeValue<T>.Cloasure)") {
                let safeObj = SafeValue<TestObject>(TestObject(property1: "", property2: 0))
                safeObj <- { $0.property2 = 200 }
                expect(safeObj.value.property2) == 200
            }
            it("test func §<T>(value: T) -> SafeValue<T>") {
                let safeValue = §10
                expect(§safeValue) == 10
            }
            it("test func §<T>(safeValue: SafeValue<T>) -> T") {
                let safeValue = §10
                expect(§safeValue) == 10
            }
            it("test func async(_ cloasure: @escaping (Value) -> Void)") {
                let safeValue = §TestObject(property1: "", property2: 20)
                safeValue.async { $0.property2 += 10 }
                expect((§safeValue).property2) == 30
                safeValue.async { $0.property2 += 100 }
                expect((§safeValue).property2) == 130
            }
            it("test func sync<T>(_ cloasure: @escaping (Value) -> T) -> T") {
                let safeValue = §TestObject(property1: "", property2: 20)
                let intValue = safeValue.sync { $0.property2 }
                expect((§safeValue).property2) == intValue
                let stringValue = safeValue.sync { $0.property1 }
                expect((§safeValue).property1) == stringValue
            }
        }
    }
}
