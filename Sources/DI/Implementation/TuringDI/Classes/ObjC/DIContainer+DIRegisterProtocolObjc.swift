//
//  DIContainer+DIRegisterProtocolObjc.swift
//  TuringDI
//
//  Created by Dmitriy Rybochkin on 15.02.2020.
//

import Foundation
import TuringDIInterface

@objc
extension DIContainer: DIRegisterProtocolObjc {

    // MARK: - Public functions

    public func register(name: String, zeroFactory: @escaping RegisterFactoryZeroObjc) {
        items.sync({
             $0[name] = Item(protocolType: Any.self,
                            types: [],
                            factory: .zero(zeroFactory),
                            completion: nil)
         })
    }

    public func register(class classType: AnyClass, zeroFactory: @escaping RegisterFactoryZeroObjc) {
        register(name: NSStringFromClass(classType), zeroFactory: zeroFactory)
    }

    public func register(protocol protocolType: Protocol, zeroFactory: @escaping RegisterFactoryZeroObjc) {
        register(name: NSStringFromProtocol(protocolType), zeroFactory: zeroFactory)
    }

    public func register(name: String, emptyFactory: @escaping RegisterFactoryEmptyObjc) {
        items.sync({
             $0[name] = Item(protocolType: Any.self,
                            types: [],
                            factory: .empty(emptyFactory),
                            completion: nil)
         })
    }

    public func register(class classType: AnyClass, emptyFactory: @escaping RegisterFactoryEmptyObjc) {
        register(name: NSStringFromClass(classType), emptyFactory: emptyFactory)
    }

    public func register(protocol protocolType: Protocol, emptyFactory: @escaping RegisterFactoryEmptyObjc) {
        register(name: NSStringFromProtocol(protocolType), emptyFactory: emptyFactory)
    }
}
