//
//  ViewController.swift
//  TuringSafe
//
//  Created by drybochkin on 04/15/2019.
//  Copyright (c) 2019 drybochkin. All rights reserved.
//

import TuringSafeDictionary
import UIKit

final class ViewController: UIViewController {

    let dictionary: TuringSafeDictionary<String, Int> = [:]

    override func viewDidLoad() {
        super.viewDidLoad()

        testDictionary()
    }
}

private extension ViewController {

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
