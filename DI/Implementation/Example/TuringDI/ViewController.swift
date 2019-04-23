//
//  ViewController.swift
//  TuringDI
//
//  Created by drybochkin on 04/12/2019.
//  Copyright (c) 2019 drybochkin. All rights reserved.
//

import TuringDIInterface
import TuringDI
import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let diContainer = TuringDI(maxDepth: 10)

        diContainer.register(ChildProtocol.self, factory: { ChildClass(di: $0) })
        diContainer.register(ParentProtocol.self, factory: {
            ParentClass(property2: $1, property3: $2, property4: $3)
        })
        let _ = diContainer.resolve(ParentProtocol.self,
                                    parameter1: 10,
                                    parameter2: 11,
                                    parameter3: nil as ParentProtocol?)
        let child1: ChildProtocol? = diContainer.resolve()
        guard let parent1: ParentProtocol = diContainer.resolve(parameter1: 10,
                                                                parameter2: "11",
                                                                parameter3: child1) else {
            return
        }
        guard let parent2 = diContainer.resolve(ParentProtocol.self,
                                                parameter1: 10,
                                                parameter2: "11",
                                                parameter3: child1) else {
            return
        }
        guard let equalParent1 = parent1 as? ParentClass else {
            return
        }
        guard let equalParent2 = parent2 as? ParentClass else {
            return
        }
        print(equalParent1, equalParent2)
    }
}

extension ViewController: TuringDISupportable { }
