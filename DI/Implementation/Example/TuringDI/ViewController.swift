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

        let di = diContainer

        // Zero params
//        di.register(ParentProtocol.self, factory: {
//            ParentClass()
//        })
//        let parentZero: ParentProtocol? = di.resolve()
//        print("Zero: ", parentZero != nil)
//
//        // One params
//        di.register(ParentProtocol.self, factory: { diContainer, parameter1 in
//            ParentClass(property2: parameter1)
//        })
//        let parentInt: ParentProtocol? = di.resolve(parameter: 100)
//        print("One: ", parentInt != nil, parentInt?.property2 == 100)
//
//        // Two params
//        di.register(ParentProtocol.self, factory: { diContainer, parameter1, parameter2 in
//            ParentClass(property3: parameter1, property4: parameter2)
//        })
//        let parentTwo: ParentProtocol? = di.resolve(parameter1: "200", parameter2: self as Any?)
//        print("Two: ",
//              parentTwo != nil,
//              parentTwo?.property3 == "200",
//              (parentTwo?.property4 as? ViewController) == self)

        // Parent-Child zero params
//        di.register(ChildProtocol.self, factory: {
//            ChildClass()
//        })
//        di.register(ParentProtocol.self, factory: {
//            ParentClass()
//        })
//        let parent: ParentProtocol? = di.resolve()
//        let child: ChildProtocol? = di.resolve()
//        parent?.property1 = child
//        child?.parent = parent
//        if let parent1 = parent, let parent2 = child?.parent {
//            print("Parent-Child Zero: ", true, true, parent1 === parent2)
//        } else {
//            print("Parent-Child Zero: ", parent != nil, child != nil, false)
//        }
//        if let child1 = parent?.property1, let child2 = child {
//            print("Child-Parent Zero: ", true, true, child1 === child2)
//        } else {
//            print("Child-Parent Zero: ", parent != nil, child != nil, false)
//        }

        // Parent-Child one param
        di.register(ParentProtocol.self, factory: { ParentClass() }, completion: { di, obj in
            obj?.property1 = di.resolve(parameter: obj)
        })
        di.register(ChildProtocol.self, factory: { ChildClass() } )
        di.register(ParentProtocol.self, factory: { di, child in
            return child?.parent == nil ? ParentClass(property1: child) : child?.parent
        })
        di.register(ChildProtocol.self, factory: { di, parent in
            ChildClass(parent: parent)
        })
        let parent0: ParentProtocol? = di.resolve()
        let child0: ChildProtocol? = parent0?.property1
        if let parent1 = parent0, let parent2 = child0?.parent {
            print("Parent-Child Zero: ", true, true, parent1 === parent2)
        } else {
            print("Parent-Child Zero: ", parent0 != nil, child0 != nil, false)
        }
        let child: ChildProtocol? = di.resolve()
        let parent: ParentProtocol? = di.resolve(parameter: child)
        if let parent1 = parent, let parent2 = child?.parent {
            print("Parent-Child Zero: ", true, true, parent1 === parent2)
        } else {
            print("Parent-Child Zero: ", parent != nil, child != nil, false)
        }

    }
}

extension ViewController: TuringDISupportable { }
