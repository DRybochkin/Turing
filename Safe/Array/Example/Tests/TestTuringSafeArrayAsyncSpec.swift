//
//  TestTuringSafeArrayAsyncSpec.swift
//  TuringSafe_Tests
//
//  Created by Dmitry Rybochkin on 16/04/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Quick
import Nimble
import TuringSafeArray

final class TestTuringSafeArrayAsyncSpec: QuickSpec {

    // MARK: - Properties

    var strongSafeArray = TuringSafeArray<Int>()

    // MARK: - Life cycle

    override func spec() {
        describe("these will success") {
            it("test async manipulating") {
                do {
                    var iterations = 1000
                    self.strongSafeArray = []

                    DispatchQueue.concurrentPerform(iterations: iterations) { index in
                        let last = self.strongSafeArray.last ?? index
                        self.strongSafeArray.append(last + 1)
                        self.strongSafeArray.append(last + 2)
                        self.strongSafeArray.removeLast(1)
                        self.strongSafeArray.append(last + 3)
                        self.strongSafeArray.removeFirst()
                        self.strongSafeArray.append(last + 10)
                        self.strongSafeArray.removeLast()
                        _ = self.strongSafeArray.makeIterator()
                        let _: TuringSafeArray<Int> = self.strongSafeArray.compactMap({ $0 })

                        DispatchQueue.global().async(flags: .barrier) {
                            iterations -= 1
                            guard iterations <= 0 else {
                                return
                            }
                        }
                    }
                }

                waitUntil { done in
                    Thread.sleep(forTimeInterval: 1.0)
                    expect(self.strongSafeArray.count) == 1000
                    done()
                }
            }
        }
    }
}
