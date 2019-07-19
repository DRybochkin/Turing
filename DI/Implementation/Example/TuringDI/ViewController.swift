//
//  ViewController.swift
//  TuringDI
//
//  Created by drybochkin on 04/12/2019.
//  Copyright (c) 2019 Dmitry Rybochkin. All rights reserved.
//

import TuringDIInterface
import TuringDI
import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()


        let diContainer: DIProtocol = DIContainer(maxRecursiveDepth: 10)

        diContainer.register(RecurciveAProtocol.self, factory: { RecurciveA(diContainer: $0) })
        diContainer.register(RecurciveBProtocol.self, factory: { RecurciveB(diContainer: $0) })

        let recursiveA: RecurciveAProtocol? = diContainer.resolveSingletone()
        print(recursiveA != nil)

        diContainer.register(ParentProtocol.self, factory: { ParentClass() })

        diContainer.register(ChildProtocol.self, factory: { ChildClass(di: $0) })
        diContainer.register(ParentProtocol.self, factory: {
            ParentClass(property2: $1, property3: $2, property4: $3)
        })
        let _ = diContainer.resolve(ParentProtocol.self,
                                    parameter1: 10,
                                    parameter2: 11,
                                    parameter3: nil as ParentProtocol?)
        let child1: ChildProtocol? = diContainer.resolve()
        let parent1: ParentProtocol! = diContainer.resolve(parameter1: 10,
                                                           parameter2: "11",
                                                           parameter3: child1)
        let parent2 = diContainer.resolve(ParentProtocol.self,
                                          parameter1: 10,
                                          parameter2: "11",
                                          parameter3: child1)
        guard let equalParent1 = parent1 as? ParentClass else {
            return
        }
        guard let equalParent2 = parent2 as? ParentClass else {
            return
        }
        print(equalParent1 == equalParent2)
        print(equalParent1 === equalParent2)

        let lazyParent: DILazy<ParentProtocol>? = diContainer.lazyResolve(ParentProtocol.self)
        let parentObject = lazyParent?.instance
        print("zzzz => 1 => " + String(describing: parentObject))

        let lazyParent2: DILazy<ParentProtocol>? = diContainer.lazyResolve(ParentProtocol.self,
                                                                           parameter1: 10,
                                                                           parameter2: "11",
                                                                           parameter3: child1)
        let parentObject2 = lazyParent2?.instance
        print("zzzz => 2 => " + String(describing: parentObject2))

        let lazyParent11 = diContainer.lazyResolve(ParentProtocol.self)
        let parentObject11 = lazyParent11.instance
        print("zzzz => 3 => " + String(describing: parentObject11))


    }
}

extension ViewController: DISupportable { }
