//
//  ViewController.swift
//  TuringSafe
//
//  Created by drybochkin on 04/15/2019.
//  Copyright (c) 2019 drybochkin. All rights reserved.
//

import TuringSafeArray
import UIKit

final class ViewController: UIViewController {

    let array: TuringSafeArray<Int> = []

    override func viewDidLoad() {
        super.viewDidLoad()

        testArray()
    }
}

private extension ViewController {

    private func testArray() {
        do {
            var iterations = 1000

            DispatchQueue.concurrentPerform(iterations: iterations) { index in
                let last = self.array.last ?? 0
                self.array.append(last + 1)
                self.array.append(last + 2)
                self.array.removeLast(1)
                self.array.append(last + 3)
                self.array.removeFirst()
                self.array.append(last + 10)
                self.array.removeLast()
                _ = self.array.makeIterator()
                let _: TuringSafeArray<Int> = self.array.compactMap({ $0 })

                DispatchQueue.global().async(flags: .barrier) {
                    iterations -= 1
                    guard iterations <= 0 else {
                        return
                    }
                }
            }
        }
    }
}
