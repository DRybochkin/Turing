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

    public func register<T>(_ protocolType: T.Type, factory: @escaping Fabric<T>) {
        register(protocolType,
                 factory: .empty(factory),
                 completion: nil)
    }

    public func register<T>(_ protocolType: T.Type, factory: @escaping FabricZero<T>) {
        register(protocolType,
                 factory: .zero(factory),
                 completion: nil)
    }

    public func register<T, P1>(_ protocolType: T.Type, factory: @escaping FabricOneParameter<T, P1>) {
        register(protocolType,
                 parametersTypes: [P1.self],
                 factory: .one(factory),
                 completion: nil)
    }

    public func register<T, P1, P2>(_ protocolType: T.Type, factory: @escaping FabricTwoParameters<T, P1, P2>) {
        register(protocolType,
                 parametersTypes: [P1.self, P2.self],
                 factory: .two(factory),
                 completion: nil)
    }

    public func register<T, P1, P2, P3>(_ protocolType: T.Type,
                                        factory: @escaping FabricThreeParameters<T, P1, P2, P3>) {
        register(protocolType,
                 parametersTypes: [P1.self, P2.self, P3.self],
                 factory: .three(factory),
                 completion: nil)
    }

    public func register<T>(_ protocolType: T.Type,
                            factory: @escaping Fabric<T>,
                            completion: @escaping FabricCompletion<T>) {
        register(protocolType,
                 factory: .empty(factory),
                 completion: completion)
    }

    public func register<T>(_ protocolType: T.Type,
                            factory: @escaping FabricZero<T>,
                            completion: @escaping FabricCompletion<T>) {
        register(protocolType,
                 factory: .zero(factory),
                 completion: completion)
    }

    public func register<T, P1>(_ protocolType: T.Type,
                                factory: @escaping FabricOneParameter<T, P1>,
                                completion: @escaping FabricCompletion<T>) {
        register(protocolType,
                 parametersTypes: [P1.self],
                 factory: .one(factory),
                 completion: completion)
    }

    public func register<T, P1, P2>(_ protocolType: T.Type,
                                    factory: @escaping FabricTwoParameters<T, P1, P2>,
                                    completion: @escaping FabricCompletion<T>) {
        register(protocolType,
                 parametersTypes: [P1.self, P2.self],
                 factory: .two(factory),
                 completion: completion)
    }

    public func register<T, P1, P2, P3>(_ protocolType: T.Type,
                                        factory: @escaping FabricThreeParameters<T, P1, P2, P3>,
                                        completion: @escaping FabricCompletion<T>) {
        register(protocolType,
                 parametersTypes: [P1.self, P2.self, P3.self],
                 factory: .three(factory),
                 completion: completion)
    }

    public func unregister(_ protocolType: Any.Type) {
        let key = hashKey(types: [protocolType])
        items.async { $0.removeValue(forKey: key) }
    }

    public func unregisterAll() {
        items.async { $0.removeAll() }
    }
}

private extension TuringDI {

    // MARK: - Private functions

    private func register<T>(_ protocolType: T.Type,
                             parametersTypes: [Any.Type],
                             factory: Factory,
                             completion: FabricCompletion<T>?) {
        var parameters: [Any.Type] = [protocolType]
        parameters.append(contentsOf: parametersTypes)
        let key = hashKey(types: parameters)
        items.async({
            $0[key] = Item(protocolType: protocolType,
                           types: parametersTypes,
                           factory: factory,
                           completion: completion)
        })
    }

    private func register<T>(_ protocolType: T.Type, factory: Factory, completion: FabricCompletion<T>?) {
        let key = hashKey(types: [protocolType])
        items.async({
            $0[key] = Item(protocolType: protocolType,
                           types: [],
                           factory: factory,
                           completion: completion)
        })
    }
}
