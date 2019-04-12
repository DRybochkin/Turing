//
//  DI.swift
//  TuringDI
//
//  Created by Dmitry Rybochkin on 09.04.2019.
//  Copyright © 2019 Turing. All rights reserved.
//

import Foundation
import TuringDIInterface

public class TuringDI {

    // MARK: - Types

    enum Scope: TuringDIScopeProtocol {
        case new
        case optional
        case singleton
    }

    // MARK: - Properties

    private var items: [String: TuringDI.Item] = [:]
    public static var `default`: TuringDIProtocol = TuringDI()
}

private extension TuringDI {

    // MARK: - Private functions

    private func hashKey(_ type: Any.Type) -> String {
        return "\(type)"
    }

    private func check(assembly: Any?, with key: String, scope: Scope) {
        switch scope {
        case .new, .singleton:
            if assembly == nil {
//                DIError.factoryReturnsNil.reportDebugFatal(userInfo: [Errors.key: key])
            }
        case .optional:
            break
        }
    }

    private func resolve<T>(item: Item, scope: Scope) -> T! {
        let key = hashKey(item.protocolType)
        switch scope {
        case .new, .optional:
            let assembly = item.factory(self) as? T
            check(assembly: assembly, with: key, scope: scope)
            return assembly
        case .singleton:
            guard let assembly = item.assembly as? T else {
                let assembly = item.factory(self) as? T
                items[key]?.assembly = assembly
                check(assembly: assembly, with: key, scope: scope)
                return assembly
            }
            return assembly
        }
    }
}

extension TuringDI {

    // MARK: - Errors

    enum DIError: Error {
        case factoryForProtocolNotFound
        case factoryReturnsNil
        case unknownScope

        static let key = "key"
        static let scope = "scope"
    }
}

extension TuringDI {

    // MARK: - SubTypes

    final class Item {

        // MARK: - Properties

        let protocolType: Any.Type
        let factory: FabricWithContainer<Any>
        let scope: TuringDIScopeProtocol
        var assembly: Any?

        init(protocolType: Any.Type, factory: @escaping FabricWithContainer<Any>, scope: TuringDIScopeProtocol, assembly: Any? = nil) {
            self.protocolType = protocolType
            self.factory = factory
            self.scope = scope
            self.assembly = assembly
        }
    }
}

extension TuringDI: TuringDIProtocol {

    // MARK: - Functions

    public func register<T>(_ protocolType: T.Type, factory: @escaping FabricWithContainer<T>, scope: TuringDIScopeProtocol) {
        let key = hashKey(protocolType)
        items[key] = TuringDI.Item(protocolType: protocolType,
                                   factory: factory,
                                   scope: scope)

    }

    public func register<T>(_ protocolType: T.Type, factory: @escaping FabricWithContainer<T>) {
        register(protocolType, factory: factory, scope: Scope.new)
    }

    public func register<T>(_ protocolType: T.Type, factory: @escaping Fabric<T>, scope: TuringDIScopeProtocol) {
        register(protocolType, factory: { _ in factory() }, scope: scope)
    }

    public func register<T>(_ protocolType: T.Type, factory: @escaping Fabric<T>) {
        register(protocolType, factory: { _ in factory() })
    }

    public func resolve<T>(_ protocolType: T.Type) -> T! {
        let key = hashKey(protocolType)
        guard let item: TuringDI.Item = items[key], let scope = item.scope as? Scope else {
//            DIError.factoryForProtocolNotFound.reportDebugFatal(userInfo: [DIError.key: key])
            return nil
        }

        switch scope {
        case .singleton:
            if let assembly = item.assembly as? T {
                return assembly
            }
        case .new, .optional:
            break
        }
        return resolve(item: item, scope: scope)
    }

    public func resolve<T>() -> T! {
        return resolve(T.self)
    }

    public func unregister(_ protocolType: Any.Type) {
        let key = hashKey(protocolType)
        items.removeValue(forKey: key)
    }

    public func unregisterAll() {
        items.removeAll()
    }
}

extension TuringDIProtocol {

    // MARK: - DIProtocol abstract functions

    func registerSingleton<T>(_ protocolType: T.Type, factory: @escaping Fabric<T>) {
        register(protocolType, factory: factory, scope: TuringDI.Scope.singleton)
    }

    func registerSingleton<T>(_ protocolType: T.Type, factory: @escaping FabricWithContainer<T>) {
        register(protocolType, factory: factory, scope: TuringDI.Scope.singleton)
    }

    func registerOptional<T>(_ protocolType: T.Type, factory: @escaping Fabric<T>) {
        register(protocolType, factory: factory, scope: TuringDI.Scope.optional)
    }

    func registerOptional<T>(_ protocolType: T.Type, factory: @escaping FabricWithContainer<T>) {
        register(protocolType, factory: factory, scope: TuringDI.Scope.optional)
    }
}

extension TuringDISupportable {

    // MARK: - DISupportable Properties

    var diContainer: TuringDIProtocol {
        return TuringDI.default
    }
}
