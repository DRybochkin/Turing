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

protocol TestObjProtocol {
    var x: Int { get }
    var y: Int { get }
    var z: Int { get }
}

struct TestParams {
    var x: Int
}

struct TestObj: TestObjProtocol {

    init(parameters: TestParams) {
        x = parameters.x
        y = 0
        z = 0
    }

    init(x: Int, y: Int, z: Int) {
        self.x = x
        self.y = y
        self.z = z
    }

    init(x: Int, y: Int) {
        self.x = x
        self.y = y
        self.z = 0
    }

    init() {
        x = 0
        y = 0
        z = 0
    }

    var x: Int
    var y: Int
    var z: Int
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let di = TuringDI.default

        di.register(TestObjProtocol.self, factory: { container, parameters in
            TestObj(parameters: parameters)
        })

        di.register(TestObjProtocol.self, factory: { container, x, y, z in
            TestObj(x: x, y: y, z: z)
        })

        di.register(TestObjProtocol.self, factory: { container, x, y in
            TestObj(x: x, y: y)
        })

        di.register(TestObjProtocol.self, factory: { container, x in
            TestObj(x: x, y: -1000)
        })

//        di.registerNew(TestObjProtocol.self, factory: { x, y, z in
//            TestObj(x: x, y: y, z: z)
//        })

        let obj: TestObjProtocol = di.resolve(TestObjProtocol.self, parameter: TestParams(x: 200))
        print(obj)

        let obj1: TestObjProtocol = di.resolve(TestObjProtocol.self, parameter1: 100, parameter2: 200, parameter3: 300)
        print(obj1)

        let obj2: TestObjProtocol = di.resolve(TestObjProtocol.self, parameter1: -100, parameter2: -200)
        print(obj2)

//        let obj3: TestObjProtocol = di.resolve(TestObjProtocol.self)
//        print(obj3)

        let obj4: TestObjProtocol = di.resolve(TestObjProtocol.self, parameter: 5000)
        print(obj4)
    }
}

