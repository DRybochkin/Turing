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

    override func viewDidLoad() {
        super.viewDidLoad()

        testArray()
    }
}

private extension ViewController {

    private func testArray() {
        do {
            var iterations = 1000
            let start = Date().timeIntervalSince1970

            DispatchQueue.concurrentPerform(iterations: iterations) { index in
                let last = array.last ?? 0
//                array.dispatchQueue.async {
//                    print("\(iterations)")
//                }

//                array.removeLast()
//                array.removeLast(1)
                array.append(last + 1)
                array.append(last + 2)
                array.removeLast(1)
                array.append(last + 3)
//                array.removeLast()
                array.append(last + 10)

                DispatchQueue.global().sync {
                    iterations -= 1


                    // Final loop
                    guard iterations <= 0 else { return }


                    let message = String(format: "Safe loop took %.3f seconds, count: %d.",
                                         Date().timeIntervalSince1970 - start,
                                         array.count)
                    print(message)
                }
            }
        }
    }
}

