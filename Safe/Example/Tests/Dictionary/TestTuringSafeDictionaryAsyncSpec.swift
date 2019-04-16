//
//  TestTuringSafeDictionaryAsyncSpec.swift
//  TuringSafe_Tests
//
//  Created by Dmitry Rybochkin on 16/04/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Quick
import Nimble
import TuringSafe

final class TestTuringSafeDictionaryAsyncSpec: QuickSpec {

    // MARK: - Properties

    var dictionary: TuringSafeDictionary<String, Int> = [:]

    // MARK: - Life cycle

    override func spec() {
        describe("these will success") {
            it("can do async manipulating") {
                do {
                    var iterations = 1000
                    self.dictionary = [:]

                    DispatchQueue.concurrentPerform(iterations: iterations) { index in
                        let last = self.dictionary.first ?? (key: "", value: 0)

                        self.dictionary["\(index)-1"] = last.value + 1
                        self.dictionary["\(index)-2"] = last.value + 1
                        self.dictionary.removeValue(forKey: "\(index)-1")
                        self.dictionary["\(index)-3"] = last.value + 1
                        self.dictionary["\(index)-4"] = last.value + 1
                        self.dictionary.removeValue(forKey: "\(index)-3")
                        self.dictionary.removeValue(forKey: "\(index)-2")
                        _ = self.dictionary.makeIterator()
                        _ = self.dictionary.compactMap({ $0 })

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
                    expect(self.dictionary.count) == 1000
                    done()
                }
            }
        }
    }
}

