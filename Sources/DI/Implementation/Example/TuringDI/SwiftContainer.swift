//
//  SwiftContainer.swift
//  TuringDI_Example
//
//  Created by Dmitriy Rybochkin on 15.02.2020.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Foundation
import TuringDI
import TuringDIInterface

final class SwiftContainer: DISupportable {

    // MARK: - Properties

    let diContainer: DIProtocol

    // MARK: - Initialization

    init(diContainer: DIProtocol) {
        self.diContainer = diContainer
    }

    // MARK: - Functions

    typealias AnyTypeGeneric<T> = T
    
    func register() {
//        // Регистрация objc класса в swift
//        diContainer.register(ChildClass.self, factory: { ChildClass(value: 101) })
//
//        // Регистрация objc класса в swift
//        diContainer.register(ChildProtocol.self, factory: { ChildClass(value: 102) })

        // Регистрация objc класса в swift
//        diContainer.register(AnyTypeGeneric<TestObjcClass>.self, factory: {
//            let result = TestObjcClass()
//            result.numberValue = 103
//            return result
//        })

        // Регистрация objc протокола в swift
//        diContainer.register(TestObjcClassProtocol.self, factory: {
//            let result = TestObjcClass()
//            result.numberValue = 104
//            return result
//        })
    }

    func resolve() {
        // резолв swift класса в swift
//        let childClass: ChildClass? = diContainer.resolve()
//        print("swift - resolve swift class -  \(childClass != nil) - \(childClass?.value ?? -1)")//
//
//        // резолв swift протокола в swift
//        let childProtocol: ChildProtocol? = diContainer.resolve()
//        print("swift - resolve swift class -  \(childProtocol != nil) - \(childProtocol?.value ?? -1)")//
//
        // резолв objc класса в swift
        let testObjcClass: TestObjcClass! = diContainer.resolve()
        print("swift - resolve objc class -  \(testObjcClass != nil) - \(testObjcClass?.numberValue ?? -1)")

//        // резолв objc протокола в swift
//        let testObjcClassProtocol: TestObjcClassProtocol! = diContainer.resolve()
//        print("swift - resolve objc protocol -  \(testObjcClassProtocol != nil) - \(testObjcClassProtocol?.numberValue ?? -1)")
    }
}
