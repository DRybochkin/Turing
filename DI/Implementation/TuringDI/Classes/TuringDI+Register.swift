//
//  TuringDI+Register.swift
//  TuringDI
//
//  Created by Dmitry Rybochkin on 12/04/2019.
//

import Foundation
import TuringDIInterface

extension TuringDI: TuringDIRegisterProtocol {

    // MARK: - Functions

    public func register<T, P1, P2, P3>(_ protocolType: T.Type, factory: @escaping FabricWithContainerAndThreeParameters<T, P1, P2, P3>, scope: TuringDIScopeProtocol) {
        register(protocolType, parametersTypes: [P1.self, P2.self, P3.self], factory: .containerAndParameters(factory), scope: scope)
    }

    public func register<T, P1, P2, P3>(_ protocolType: T.Type, factory: @escaping FabricWithContainerAndThreeParameters<T, P1, P2, P3>) {
        register(protocolType, parametersTypes: [P1.self, P2.self, P3.self], factory: .containerAndParameters(factory), scope: Scope.new)
    }

    public func register<T, P1, P2>(_ protocolType: T.Type, factory: @escaping FabricWithContainerAndTwoParameters<T, P1, P2>, scope: TuringDIScopeProtocol) {
        register(protocolType, parametersTypes: [P1.self, P2.self], factory: .containerAndParameters(factory), scope: scope)
    }

    public func register<T, P1, P2>(_ protocolType: T.Type, factory: @escaping FabricWithContainerAndTwoParameters<T, P1, P2>) {
        register(protocolType, parametersTypes: [P1.self, P2.self], factory: .containerAndParameters(factory), scope: Scope.new)
    }

    public func register<T, P>(_ protocolType: T.Type, factory: @escaping FabricWithContainerAndParameters<T, P>, scope: TuringDIScopeProtocol) {
        register(protocolType, parametersTypes: [P.self], factory: .containerAndParameters(factory), scope: scope)
    }

    public func register<T, P>(_ protocolType: T.Type, factory: @escaping FabricWithContainerAndParameters<T, P>) {
        register(protocolType, parametersTypes: [P.self], factory: .containerAndParameters(factory), scope: Scope.new)
    }

    public func register<T>(_ protocolType: T.Type, factory: @escaping FabricWithContainer<T>, scope: TuringDIScopeProtocol) {
        register(protocolType, factory: .container(factory), scope: scope)
    }

    public func register<T>(_ protocolType: T.Type, factory: @escaping FabricWithContainer<T>) {
        register(protocolType, factory: .container(factory), scope: Scope.new)
    }

    public func register<T, P1, P2, P3>(_ protocolType: T.Type, factory: @escaping FabricWithThreeParameters<T, P1, P2, P3>, scope: TuringDIScopeProtocol) {
        register(protocolType, parametersTypes: [P1.self, P2.self, P3.self], factory: .parameters(factory), scope: scope)
    }

    public func registerNew<T, P1, P2, P3>(_ protocolType: T.Type, factory: @escaping FabricWithThreeParameters<T, P1, P2, P3>) {
        register(protocolType, parametersTypes: [P1.self, P2.self, P3.self], factory: .parameters(factory), scope: Scope.new)
    }

    public func register<T, P1, P2>(_ protocolType: T.Type, factory: @escaping FabricWithTwoParameters<T, P1, P2>, scope: TuringDIScopeProtocol) {
        register(protocolType, parametersTypes: [P1.self, P2.self], factory: .parameters(factory), scope: scope)
    }

    public func registerNew<T, P1, P2>(_ protocolType: T.Type, factory: @escaping FabricWithTwoParameters<T, P1, P2>) {
        register(protocolType, parametersTypes: [P1.self, P2.self], factory: .parameters(factory), scope: Scope.new)
    }

    public func register<T, P>(_ protocolType: T.Type, factory: @escaping FabricWithParameters<T, P>, scope: TuringDIScopeProtocol) {
        register(protocolType, parametersTypes: [P.self], factory: .parameters(factory), scope: scope)
    }

    public func registerNew<T, P>(_ protocolType: T.Type, factory: @escaping FabricWithParameters<T, P>) {
        register(protocolType, parametersTypes: [P.self], factory: .parameters(factory), scope: Scope.new)
    }

    public func register<T>(_ protocolType: T.Type, factory: @escaping Fabric<T>, scope: TuringDIScopeProtocol) {
        register(protocolType, factory: .empty(factory), scope: scope)
    }

    public func registerNew<T>(_ protocolType: T.Type, factory: @escaping Fabric<T>) {
        register(protocolType, factory: .empty(factory), scope: Scope.new)
    }

    public func unregister(_ protocolType: Any.Type) {
        let key = hashKey(types: [protocolType])
        items.removeValue(forKey: key)
    }

    public func unregisterAll() {
        items.removeAll()
    }
}

private extension TuringDI {

    // MARK: - Private functions

    private func register<T>(_ protocolType: T.Type, parametersTypes: [Any.Type], factory: Factory, scope: TuringDIScopeProtocol) {
        var parameters: [Any.Type] = [protocolType]
        parameters.append(contentsOf: parametersTypes)
        let key = hashKey(types: parameters)
        items[key] = Item(protocolType: protocolType, factory: factory, scope: scope)
    }

    private func register<T>(_ protocolType: T.Type, factory: Factory, scope: TuringDIScopeProtocol) {
        let key = hashKey(types: [protocolType])
        items[key] = Item(protocolType: protocolType, factory: factory, scope: scope)
    }
}
