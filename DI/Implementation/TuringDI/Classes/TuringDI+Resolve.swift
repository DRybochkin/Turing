//
//  TuringDI+Resolve.swift
//  TuringDI
//
//  Created by Dmitry Rybochkin on 12/04/2019.
//

import Foundation
import TuringDIInterface

extension TuringDI: TuringDIResolveProtocol {

    // MARK: - Functions

    public func resolve<T, P1, P2, P3>(_ protocolType: T.Type, parameter1: P1, parameter2: P2, parameter3: P3) -> T! {
        let key = hashKey(types: [protocolType, P1.self, P2.self, P3.self])

        guard let item: TuringDI.Item = items[key], let scope = item.scope as? Scope else {
            //            DIError.factoryForProtocolNotFound.reportDebugFatal(userInfo: [DIError.key: key])
            return nil
        }

        if case .singleton = scope, let assembly = item.assembly as? T {
            return assembly
        }

        return resolve(item: item, parameter1: parameter1, parameter2: parameter2, parameter3: parameter3, scope: scope)
    }

    public func resolve<T, P>(_ protocolType: T.Type, parameter: P) -> T! {
        let key = hashKey(types: [protocolType, P.self])

        guard let item: TuringDI.Item = items[key], let scope = item.scope as? Scope else {
            //            DIError.factoryForProtocolNotFound.reportDebugFatal(userInfo: [DIError.key: key])
            return nil
        }

        if case .singleton = scope, let assembly = item.assembly as? T {
            return assembly
        }

        return resolve(item: item, parameter: parameter, scope: scope)
    }

    public func resolve<T, P1, P2>(_ protocolType: T.Type, parameter1: P1, parameter2: P2) -> T! {
        let key = hashKey(types: [protocolType, P1.self, P2.self])

        guard let item: TuringDI.Item = items[key], let scope = item.scope as? Scope else {
            //            DIError.factoryForProtocolNotFound.reportDebugFatal(userInfo: [DIError.key: key])
            return nil
        }

        if case .singleton = scope, let assembly = item.assembly as? T {
            return assembly
        }

        return resolve(item: item, parameter1: parameter1, parameter2: parameter2, scope: scope)
    }

    public func resolve<T>(_ protocolType: T.Type) -> T! {
        let key = hashKey(types: [protocolType])
        guard let item: TuringDI.Item = items[key], let scope = item.scope as? Scope else {
            //            DIError.factoryForProtocolNotFound.reportDebugFatal(userInfo: [DIError.key: key])
            return nil
        }

        if case .singleton = scope, let assembly = item.assembly as? T {
            return assembly
        }

        return resolve(item: item, scope: scope)
    }

    public func resolve<T>() -> T! {
        return resolve(T.self)
    }
}

private extension TuringDI {

    // MARK: - Private functions

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
        let key = hashKey(types: [item.protocolType])

        if case .singleton = scope, let assembly = item.assembly as? T {
            return assembly
        }

        let assembly: T?
        switch item.factory {
        case .empty(let factory as Fabric<T>):
            assembly = factory()
        case .container(let factory as FabricWithContainer<T>):
            assembly = factory(self)
        default:
            assembly = nil
        }

        if case .singleton = scope {
            items[key]?.assembly = assembly
        }

        check(assembly: assembly, with: key, scope: scope)
        return assembly
    }

    private func resolve<T, P>(item: Item, parameter: P, scope: Scope) -> T! {
        let key = hashKey(types: [item.protocolType, P.self])

        if case .singleton = scope, let assembly = item.assembly as? T {
            return assembly
        }

        let assembly: T?
        switch item.factory {
        case .empty(let factory as Fabric<T>):
            assembly = factory()
        case .container(let factory as FabricWithContainer<T>):
            assembly = factory(self)
        case .parameters(let factory as FabricWithParameters<T, P>):
            assembly = factory(parameter)
        case .containerAndParameters(let factory as FabricWithContainerAndParameters<T, P>):
            assembly = factory(self, parameter)
        default:
            assembly = nil
        }

        if case .singleton = scope {
            items[key]?.assembly = assembly
        }

        check(assembly: assembly, with: key, scope: scope)
        return assembly
    }

    private func resolve<T, P1, P2>(item: Item, parameter1: P1, parameter2: P2, scope: Scope) -> T! {
        let key = hashKey(types: [item.protocolType, P1.self, P2.self])

        if case .singleton = scope, let assembly = item.assembly as? T {
            return assembly
        }

        let assembly: T?
        switch item.factory {
        case .parameters(let factory as FabricWithTwoParameters<T, P1, P2>):
            assembly = factory(parameter1, parameter2)
        case .containerAndParameters(let factory as FabricWithContainerAndTwoParameters<T, P1, P2>):
            assembly = factory(self, parameter1, parameter2)
        default:
            assembly = nil
        }

        if case .singleton = scope {
            items[key]?.assembly = assembly
        }

        check(assembly: assembly, with: key, scope: scope)
        return assembly
    }

    private func resolve<T, P1, P2, P3>(item: Item, parameter1: P1, parameter2: P2, parameter3: P3, scope: Scope) -> T! {
        let key = hashKey(types: [item.protocolType, P1.self, P2.self, P3.self])

        if case .singleton = scope, let assembly = item.assembly as? T {
            return assembly
        }

        let assembly: T?
        switch item.factory {
        case .parameters(let factory as FabricWithThreeParameters<T, P1, P2, P3>):
            assembly = factory(parameter1, parameter2, parameter3)
        case .containerAndParameters(let factory as FabricWithContainerAndThreeParameters<T, P1, P2, P3>):
            assembly = factory(self, parameter1, parameter2, parameter3)
        default:
            assembly = nil
        }

        if case .singleton = scope {
            items[key]?.assembly = assembly
        }

        check(assembly: assembly, with: key, scope: scope)
        return assembly
    }
}
