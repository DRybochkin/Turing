//
//  ViewController.swift
//  TuringSafe
//
//  Created by drybochkin on 04/15/2019.
//  Copyright (c) 2019 drybochkin. All rights reserved.
//

import TuringSafe
import UIKit

final class ViewController: UIViewController {

    let array: TuringSafeArray<Int> = []
    let dictionary: TuringSafeDictionary<String, Int> = [:]

    let safeInt: TuringSafeValue<Int> = TuringSafeValue(0)
    let safeString: TuringSafeValue<String> = TuringSafeValue("")
    private let safeEnum: TuringSafeValue<TestEnum> = TuringSafeValue(.test1)
    private let safeStruct: TuringSafeValue<TestStruct> = TuringSafeValue(.init(property1: "", property2: 0))
    private let safeObject: TuringSafeValue<TestObject> = TuringSafeValue(.init(property1: "", property2: 0))

    override func viewDidLoad() {
        super.viewDidLoad()

//        testValue()
//        testArray()
        testDictionary()
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

    private func testArray() {
        do {
            var iterations = 1000
            let start = Date().timeIntervalSince1970

            DispatchQueue.concurrentPerform(iterations: iterations) { index in
                let last = self.array.last ?? 0

                self.array.append(last + 1)
                self.array.append(last + 2)
                self.array.removeLast(1)
                self.array.append(last + 3)
                self.array.append(last + 10)
                _ = self.array.makeIterator()

                DispatchQueue.global().async(flags: .barrier) {
                    iterations -= 1


                    // Final loop
                    guard iterations <= 0 else { return }


                    let message = String(format: "Safe loop took %.3f seconds, count: %d.",
                                         Date().timeIntervalSince1970 - start,
                                         self.array.count)
                    print(message)
                }
            }
        }
    }

    private func testDictionary() {
        do {
            var iterations = 1000
            let start = Date().timeIntervalSince1970

            DispatchQueue.concurrentPerform(iterations: iterations) { index in
                let last = self.dictionary.first ?? (key: "", value: 0)

                self.dictionary["\(index)-1"] = last.value + 1
                self.dictionary["\(index)-2"] = last.value + 1
                self.dictionary.removeValue(forKey: "\(index)-1")
                self.dictionary["\(index)-3"] = last.value + 1
                self.dictionary["\(index)-4"] = last.value + 1
                self.dictionary.removeValue(forKey: "\(index)-3")
                _ = self.dictionary.makeIterator()
                _ = self.dictionary.compactMap({ $0 })

                DispatchQueue.global().async(flags: .barrier) {
                    iterations -= 1


                    // Final loop
                    guard iterations <= 0 else { return }


                    let message = String(format: "Safe loop took %.3f seconds, count: %d.",
                                         Date().timeIntervalSince1970 - start,
                                         self.dictionary.count)
                    print(message)
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
