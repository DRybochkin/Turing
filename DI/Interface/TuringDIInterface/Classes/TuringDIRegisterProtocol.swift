//
//  TuringDIRegisterProtocol.swift
//  TuringDIInterface
//
//  Created by Dmitry Rybochkin on 12/04/2019.
//

import Foundation

public protocol TuringDIRegisterProtocol {

    // MARK: - Types

    typealias FabricWithContainerAndThreeParameters<T, P1, P2, P3> = (TuringDIProtocol, P1, P2, P3) -> T?
    typealias FabricWithThreeParameters<T, P1, P2, P3> = (P1, P2, P3) -> T?
    typealias FabricWithContainerAndTwoParameters<T, P1, P2> = (TuringDIProtocol, P1, P2) -> T?
    typealias FabricWithTwoParameters<T, P1, P2> = (P1, P2) -> T?
    typealias FabricWithContainerAndParameters<T, P> = (TuringDIProtocol, P) -> T?
    typealias FabricWithParameters<T, P> = (P) -> T?
    typealias FabricWithContainer<T> = (TuringDIProtocol) -> T?
    typealias Fabric<T> = () -> T?

    // MARK: - Functions

    func register<T>(_ protocolType: T.Type, factory: @escaping Fabric<T>, scope: TuringDIScopeProtocol)
    func registerNew<T>(_ protocolType: T.Type, factory: @escaping Fabric<T>)
    func register<T, P>(_ protocolType: T.Type, factory: @escaping FabricWithParameters<T, P>, scope: TuringDIScopeProtocol)
    func registerNew<T, P>(_ protocolType: T.Type, factory: @escaping FabricWithParameters<T, P>)
    func register<T, P1, P2>(_ protocolType: T.Type, factory: @escaping FabricWithTwoParameters<T, P1, P2>, scope: TuringDIScopeProtocol)
    func registerNew<T, P1, P2>(_ protocolType: T.Type, factory: @escaping FabricWithTwoParameters<T, P1, P2>)
    func register<T, P1, P2, P3>(_ protocolType: T.Type, factory: @escaping FabricWithThreeParameters<T, P1, P2, P3>, scope: TuringDIScopeProtocol)
    func registerNew<T, P1, P2, P3>(_ protocolType: T.Type, factory: @escaping FabricWithThreeParameters<T, P1, P2, P3>)

    func register<T>(_ protocolType: T.Type, factory: @escaping FabricWithContainer<T>, scope: TuringDIScopeProtocol)
    func register<T>(_ protocolType: T.Type, factory: @escaping FabricWithContainer<T>)
    func register<T, P>(_ protocolType: T.Type, factory: @escaping FabricWithContainerAndParameters<T, P>, scope: TuringDIScopeProtocol)
    func register<T, P>(_ protocolType: T.Type, factory: @escaping FabricWithContainerAndParameters<T, P>)
    func register<T, P1, P2>(_ protocolType: T.Type, factory: @escaping FabricWithContainerAndTwoParameters<T, P1, P2>, scope: TuringDIScopeProtocol)
    func register<T, P1, P2>(_ protocolType: T.Type, factory: @escaping FabricWithContainerAndTwoParameters<T, P1, P2>)
    func register<T, P1, P2, P3>(_ protocolType: T.Type, factory: @escaping FabricWithContainerAndThreeParameters<T, P1, P2, P3>, scope: TuringDIScopeProtocol)
    func register<T, P1, P2, P3>(_ protocolType: T.Type, factory: @escaping FabricWithContainerAndThreeParameters<T, P1, P2, P3>)

    func unregister(_ protocolType: Any.Type)
    func unregisterAll()
}
