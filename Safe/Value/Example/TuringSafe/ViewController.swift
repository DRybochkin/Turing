//
//  ViewController.swift
//  TuringSafe
//
//  Created by drybochkin on 04/15/2019.
//  Copyright (c) 2019 drybochkin. All rights reserved.
//

import TuringSafeValue
import UIKit

final class ViewController: UIViewController {

    let safeInt: TuringSafeValue<Int> = TuringSafeValue(0)
    let safeString: TuringSafeValue<String> = TuringSafeValue("")
    private let safeEnum: TuringSafeValue<TestEnum> = TuringSafeValue(.test1)
    private let safeStruct: TuringSafeValue<TestStruct> = TuringSafeValue(.init(property1: "", property2: 0))
    private let safeObject: TuringSafeValue<TestObject> = TuringSafeValue(.init(property1: "", property2: 0))

    override func viewDidLoad() {
        super.viewDidLoad()

        let safeInt = TuringSafeValue<Int>(0)
        safeInt <- 1

        let safeObj = TuringSafeValue<TestObject>(TestObject(property1: "", property2: 0))

        safeObj <- { $0.property2 = 10 }

        let safeInt2 = §200
        print(§safeInt2)

        var safeInt1: TuringSafeValue<Int> = §100
        print(§safeInt1)

        let index = §safeInt
        print(index)

        safeInt1 += safeInt2
        safeInt1 -= safeInt1

        print(§safeInt1, §safeInt2)
        print(safeInt1, safeInt2)

        testValue()
    }
}

private extension ViewController {

    private func testValue() {
        do {
            var iterations = 1000
            var index1 = 0
            let start = Date().timeIntervalSince1970


            DispatchQueue.concurrentPerform(iterations: iterations) { index in
                self.safeInt.value = self.safeInt.value + index
                self.safeString.value = self.safeString.value + "\(iterations)"
                switch self.safeEnum.value {
                case .test1:
                    self.safeEnum.value = .test2
                case .test2:
                    self.safeEnum.value = .test1
                }
                self.safeStruct.value = TestStruct(property1: self.safeObject.value.property1,
                                                   property2: self.safeInt.value)
                self.safeObject.value = TestObject(property1: self.safeString.value,
                                                   property2: self.safeStruct.value.property2)
                DispatchQueue.global().async(flags: .barrier) {
                    iterations -= 1
                    index1 += 1
                    guard iterations <= 0 else {
                        return
                    }

                    let message = String(format: "Safe loop took %.3f seconds, count: %d.",
                                         Date().timeIntervalSince1970 - start,
                                         index1)
                    print(message)
                    print(self.safeInt.value,
                          self.safeString.value,
                          self.safeEnum.value,
                          self.safeStruct.value,
                          self.safeObject.value)
               }
            }
        }
    }
}

private extension ViewController {

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
        var property2: Int

        init(property1: String, property2: Int) {
            self.property1 = property1
            self.property2 = property2
        }

        static func == (lhs: TestObject, rhs: TestObject) -> Bool {
            return lhs.property1 == rhs.property1 && lhs.property2 == rhs.property2
        }
    }
}
