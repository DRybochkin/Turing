//
//  TestTuringSafeValueAsyncSpec.swift
//  TuringSafe_Tests
//
//  Created by Dmitry Rybochkin on 17/04/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Quick
import Nimble
import TuringSafeValue

final class TestTuringSafeValueAsyncSpec: QuickSpec {

    // MARK: - Life cycle

    override func spec() {
        describe("these will success") {
            it("test async manipulating") {
                var state = "passing"
                do {
                    var iterations = 1000
                    let safeString: TuringSafeValue<String> = TuringSafeValue("")
                    let safeInt: TuringSafeValue<Int> = TuringSafeValue(0)
                    let safeEnum: TuringSafeValue<TestEnum> = TuringSafeValue(.test1)
                    let safeStruct: TuringSafeValue<TestStruct> = TuringSafeValue(.init(property1: "", property2: 0))
                    let safeObject: TuringSafeValue<TestObject> = TuringSafeValue(.init(property1: "", property2: 0))

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
