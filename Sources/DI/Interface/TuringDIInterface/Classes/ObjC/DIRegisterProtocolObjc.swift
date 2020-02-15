//
//  DIRegisterProtocolObjc.swift
//  TuringDIInterface
//
//  Created by Dmitriy Rybochkin on 15.02.2020.
//

import Foundation

@objc
public protocol DIRegisterProtocolObjc: class {

    // MARK: - Types

    typealias RegisterFactoryZeroObjc = (DIResolveProtocolObjc) -> Any?
    typealias RegisterFactoryEmptyObjc = () -> Any?

    // MARK: - Public functions

    @objc
    func register(name: String, zeroFactory: @escaping RegisterFactoryZeroObjc)
    @objc
    func register(class: AnyClass, zeroFactory: @escaping RegisterFactoryZeroObjc)
    @objc
    func register(protocol: Protocol, zeroFactory: @escaping RegisterFactoryZeroObjc)
    @objc
    func register(name: String, emptyFactory: @escaping RegisterFactoryEmptyObjc)
    @objc
    func register(class: AnyClass, emptyFactory: @escaping RegisterFactoryEmptyObjc)
    @objc
    func register(protocol: Protocol, emptyFactory: @escaping RegisterFactoryEmptyObjc)
}

