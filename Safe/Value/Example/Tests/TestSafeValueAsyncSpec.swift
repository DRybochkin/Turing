//
//  TestSafeValueAsyncSpec.swift
//  TuringSafeValue_Tests
//
//  Created by Dmitry Rybochkin on 17/04/2019.
//  Copyright (c) 2019 Dmitry Rybochkin. All rights reserved.
//

import Quick
import Nimble
import TuringSafeValue

final class TestSafeValueAsyncSpec: QuickSpec {

    // MARK: - Life cycle

    override func spec() {
        describe("these will success") {
            it("test async manipulating") {
                waitUntil(timeout: 1.0, action: { done in
                    var iterations = 1000
                    let safeString: SafeValue<String> = SafeValue("")
                    let safeInt: SafeValue<Int> = SafeValue(0)
                    let safeEnum: SafeValue<TestEnum> = SafeValue(.test1)
                    let safeStruct: SafeValue<TestStruct> = SafeValue(.init(property1: "", property2: 0))
                    let safeObject: SafeValue<TestObject> = SafeValue(.init(property1: "", property2: 0))

                    DispatchQueue.concurrentPerform(iterations: iterations) { index in
                        safeInt.value = index
                        let tempValue = safeString.value + "\(safeInt.value)"
                        safeString.value = tempValue
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
                            expect(true) == true
                            done()
                        }
                    }
                })
            }
        }
    }
}
