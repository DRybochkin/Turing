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

protocol TestObjProtocol2: TestObjProtocol {
}

protocol TestObjProtocol: class {
    var x: Int { get }
    var y: Int { get }
    var z: Int { get }
    var testObj: TestObjProtocol? { get set }
}

struct TestParams {
    var x: Int
    var testObj: TestObjProtocol?
}

class TestObj: TestObjProtocol2 {

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

    init(x: Int) {
        self.x = x
        self.y = 0
        self.z = 0
    }

    init() {
        x = 0
        y = 0
        z = 0
    }

    init(testObj: TestObjProtocol?) {
        self.testObj = testObj
        x = testObj?.x ?? -1
        y = testObj?.y ?? -1
        z = testObj?.z ?? -1
    }

    weak var testObj: TestObjProtocol?

    var x: Int
    var y: Int
    var z: Int
}

class ViewController: UIViewController {

    private var testObj: TestObj?
    private lazy var lazyTestObj: TestObj? = diContainer.resolve()

    override func viewDidLoad() {
        super.viewDidLoad()

        let di = diContainer

        di.register(TestObjProtocol.self, factory: { di in
            TestObj()
        }, completion: { di, result in
            let testObj: TestObjProtocol2? = di.resolve()
            result?.testObj = testObj
        })

        di.register(TestObjProtocol2.self, factory: { di in
            TestObj()
        }, completion: { di, result in
            let testObj: TestObjProtocol? = di.resolve()
            result?.testObj = testObj
        })

        let testObj: TestObjProtocol? = di.resolveSingletone()
//        let testObj2: TestObjProtocol? = di.resolve()
//        testObj?.testObj = testObj2
//        testObj2?.testObj = testObj
        print(testObj?.testObj?.x ?? -400)
        print(testObj?.x ?? -500)
//        if let testObj = testObj2 {
//            print(testObj.x)
//        }

//        di.register(TestObjProtocol.self, factory: { _, parameters in
//            TestObj(parameters: parameters)
//        })
//
//        di.register(TestObjProtocol.self, factory: { _ in
//            TestObj()
//        })
//
//        di.register(TestObjProtocol.self, factory: { _, x in
//            TestObj(x: x)
//        })
//
//        di.register(TestObjProtocol.self, factory: { _, x, y in
//            TestObj(x: x, y: y)
//        })
//
//        di.register(TestObjProtocol.self, factory: { _, x, y, z in
//            TestObj(x: x, y: y, z: z)
//        })
//
//        let objT: TestObjProtocol? = di.resolve(TestObjProtocol.self, parameter: TestParams(x: 200))
//        print(String(describing: objT))
//
//        let obj1: TestObjProtocol? = di.resolve(TestObjProtocol.self, parameter: 100)
//        print(String(describing: obj1))
//
//        let obj2: TestObjProtocol? = di.resolve(TestObjProtocol.self, parameter1: 100, parameter2: 200)
//        print(String(describing: obj2))
//
//        let obj3: TestObjProtocol? = di.resolve(TestObjProtocol.self, parameter1: 100, parameter2: 200, parameter3: 300)
//        print(String(describing: obj3))
//
//        let obj0: TestObjProtocol? = di.resolve(TestObjProtocol.self)
//        print(String(describing: obj0))

    }
}

extension ViewController: TuringDISupportable { }
