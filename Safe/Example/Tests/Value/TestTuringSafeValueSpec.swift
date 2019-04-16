//
//  TestTuringSafeValueSpec.swift
//  TuringSafe_Tests
//
//  Created by Dmitry Rybochkin on 16/04/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Quick
import Nimble
import TuringSafe

final class TestTuringSafeValueSpec: QuickSpec {

    // MARK: - Life cycle

    override func spec() {
        describe("these will success") {
            it("can do init int") {
                let safeArray: TuringSafeValue<Int> = TuringSafeValue(101)
                expect(safeArray.value) == 101
                expect(safeArray.value) != 10
                expect(safeArray.value) != 0
            }
            it("can do init String") {
                let safeArray: TuringSafeValue<String> = TuringSafeValue("101")
                expect(safeArray.value) == "101"
                expect(safeArray.value) != ""
                expect(safeArray.value) != "1"
            }
            it("can do init struct") {
                let safeArray: TuringSafeValue<TestStruct> = TuringSafeValue(.init(property1: "", property2: 0))
                expect(safeArray.value) == TestStruct(property1: "", property2: 0)
                expect(safeArray.value) != TestStruct(property1: "1", property2: 0)
                expect(safeArray.value) != TestStruct(property1: "", property2: 1)
                expect(safeArray.value) != TestStruct(property1: "1", property2: 1)
            }
            it("can do init object") {
                let safeArray: TuringSafeValue<TestObject> = TuringSafeValue(.init(property1: "", property2: 0))
                expect(safeArray.value) == TestObject(property1: "", property2: 0)
                expect(safeArray.value) != TestObject(property1: "1", property2: 0)
                expect(safeArray.value) != TestObject(property1: "", property2: 1)
                expect(safeArray.value) != TestObject(property1: "1", property2: 1)
            }
            it("can do init enum") {
                let safeArray: TuringSafeValue<TestEnum> = TuringSafeValue(.test1)
                expect(safeArray.value) == .test1
                expect(safeArray.value) != .test2
            }
            it("can do async manipulating") {
                var state = "passing"
                do {
                    var iterations = 10
                    let safeString: TuringSafeValue<String> = TuringSafeValue("")
                    let safeInt: TuringSafeValue<Int> = TuringSafeValue(0)
                    let safeEnum: TuringSafeValue<TestEnum> = TuringSafeValue(.test1)
                    let safeStruct: TuringSafeValue<TestStruct> = TuringSafeValue(.init(property1: "", property2: 0))
                    let safeObject: TuringSafeValue<TestObject> = TuringSafeValue(.init(property1: "", property2: 0))

                    DispatchQueue.concurrentPerform(iterations: iterations) { index in
                        state = "\(index)"
                        safeInt.value = index
                        safeString.value = safeString.value + "\(safeInt.value)"
                        switch safeEnum.value {
                        case .test1:
                            safeEnum.value = .test2
                        case .test2:
                            safeEnum.value = .test1
                        }
                        safeStruct.value = TestStruct(property1: safeObject.value.property1,
                                                      property2: safeInt.value)
                        safeObject.value = TestObject(property1: safeString.value,
                                                      property2: safeStruct.value.property2)
                        DispatchQueue.global().async(flags: .barrier) {
                            iterations -= 1
                            guard iterations <= 0 else {
                                return
                            }
                            state = "done"
                        }
                    }
                }

                waitUntil { done in
                    Thread.sleep(forTimeInterval: 1.0)
                    expect(state) == "done"
                    done()
                }
            }

        }
    }
}

private extension TestTuringSafeValueSpec {

    // MARK: - Types

    private enum TestEnum {
        case test1
        case test2
    }

    private struct TestStruct: Equatable {
        let property1: String
        let property2: Int
    }

    private final class TestObject: Equatable {

        let property1: String
        let property2: Int

        init(property1: String, property2: Int) {
            self.property1 = property1
            self.property2 = property2
        }

        static func == (lhs: TestObject, rhs: TestObject) -> Bool {
            return lhs.property1 == rhs.property1 && lhs.property2 == rhs.property2
        }
    }
}
