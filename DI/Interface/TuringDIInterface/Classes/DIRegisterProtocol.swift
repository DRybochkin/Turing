//
//  DIRegisterProtocol.swift
//  TuringDIInterface
//
//  Created by Dmitry Rybochkin on 12/04/2019.
//  Copyright (c) 2019 Dmitry Rybochkin. All rights reserved.
//

import Foundation

public protocol DIRegisterProtocol {

    // MARK: - Types

    typealias FabricThreeParameters<T, P1, P2, P3> = (DIResolveProtocol, P1, P2, P3) -> T?
    typealias FabricTwoParameters<T, P1, P2> = (DIResolveProtocol, P1, P2) -> T?
    typealias FabricOneParameter<T, P1> = (DIResolveProtocol, P1) -> T?
    typealias FabricZero<T> = (DIResolveProtocol) -> T?
    typealias Fabric<T> = () -> T?
    typealias FabricCompletion<T> = (DIResolveProtocol, T?) -> Void

    // MARK: - Functions

    func register<T>(_ protocolType: T.Type, factory: @escaping Fabric<T>)
    func register<T>(_ protocolType: T.Type, factory: @escaping FabricZero<T>)
    func register<T, P1>(_ protocolType: T.Type, factory: @escaping FabricOneParameter<T, P1>)
    func register<T, P1, P2>(_ protocolType: T.Type, factory: @escaping FabricTwoParameters<T, P1, P2>)
    func register<T, P1, P2, P3>(_ protocolType: T.Type, factory: @escaping FabricThreeParameters<T, P1, P2, P3>)

    func register<T>(_ protocolType: T.Type,
                     factory: @escaping Fabric<T>,
                     completion: @escaping FabricCompletion<T>)
    func register<T>(_ protocolType: T.Type,
                     factory: @escaping FabricZero<T>,
                     completion: @escaping FabricCompletion<T>)
    func register<T, P1>(_ protocolType: T.Type,
                         factory: @escaping FabricOneParameter<T, P1>,
                         completion: @escaping FabricCompletion<T>)
    func register<T, P1, P2>(_ protocolType: T.Type,
                             factory: @escaping FabricTwoParameters<T, P1, P2>,
                             completion: @escaping FabricCompletion<T>)
    func register<T, P1, P2, P3>(_ protocolType: T.Type,
                                 factory: @escaping FabricThreeParameters<T, P1, P2, P3>,
                                 completion: @escaping FabricCompletion<T>)

    func unregister(_ protocolType: Any.Type)
    func unregisterAll()
}
