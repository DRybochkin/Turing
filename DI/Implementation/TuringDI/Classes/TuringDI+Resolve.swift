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

    public func resolve<T, P1, P2, P3>(_ protocolType: T.Type, parameter1: P1, parameter2: P2, parameter3: P3) -> T? {
        return resolve(protocolType,
                       parameter1: parameter1,
                       parameter2: parameter2,
                       parameter3: parameter3,
                       scope: Scope.new)
    }

    public func resolve<T, P>(_ protocolType: T.Type, parameter: P) -> T? {
        return resolve(protocolType,
                       parameter: parameter,
                       scope: Scope.new)
    }

    public func resolve<T, P1, P2>(_ protocolType: T.Type, parameter1: P1, parameter2: P2) -> T? {
        return resolve(protocolType,
                       parameter1: parameter1,
                       parameter2: parameter2,
                       scope: Scope.new)
    }

    public func resolve<T>(_ protocolType: T.Type) -> T? {
        return resolve(protocolType,
                       scope: Scope.new)
    }

    public func resolve<T, P1, P2, P3>(parameter1: P1, parameter2: P2, parameter3: P3) -> T? {
        return resolve(T.self,
                       parameter1: parameter1,
                       parameter2: parameter2,
                       parameter3: parameter3)
    }

    public func resolve<T, P1, P2>(parameter1: P1, parameter2: P2) -> T? {
        return resolve(T.self,
                       parameter1: parameter1,
                       parameter2: parameter2)
    }

    public func resolve<T, P>(parameter: P) -> T? {
        return resolve(T.self,
                       parameter: parameter)
    }

    public func resolve<T>() -> T? {
        return resolve(T.self)
    }

    public func resolveSingletone<T, P1, P2, P3>(_ protocolType: T.Type, parameter1: P1, parameter2: P2, parameter3: P3) -> T? {
        return resolve(protocolType,
                       parameter1: parameter1,
                       parameter2: parameter2,
                       parameter3: parameter3,
                       scope: Scope.singleton)
    }

    public func resolveSingletone<T, P1, P2>(_ protocolType: T.Type, parameter1: P1, parameter2: P2) -> T? {
        return resolve(protocolType,
                       parameter1: parameter1,
                       parameter2: parameter2,
                       scope: Scope.singleton)
    }

    public func resolveSingletone<T, P>(_ protocolType: T.Type, parameter: P) -> T? {
        return resolve(protocolType,
                       parameter: parameter,
                       scope: Scope.singleton)
    }

    public func resolveSingletone<T>(_ protocolType: T.Type) -> T? {
        return resolve(protocolType,
                       scope: Scope.singleton)
    }

    public func resolveSingletone<T, P1, P2, P3>(parameter1: P1, parameter2: P2, parameter3: P3) -> T? {
        return resolveSingletone(T.self,
                                 parameter1: parameter1,
                                 parameter2: parameter2,
                                 parameter3: parameter3)
    }

    public func resolveSingletone<T, P1, P2>(parameter1: P1, parameter2: P2) -> T? {
        return resolveSingletone(T.self,
                                 parameter1: parameter1,
                                 parameter2: parameter2)
    }

    public func resolveSingletone<T, P>(parameter: P) -> T? {
        return resolveSingletone(T.self,
                                 parameter: parameter)
    }

    public func resolveSingletone<T>() -> T? {
        return resolveSingletone(T.self)
    }
}

private extension TuringDI {

    // MARK: - Private functions

    private func incrementDepth() {
        depth.value = depth.value + 1
    }

    private func decrementDepth() {
        depth.value = depth.value - 1
    }

    private func canContinue() -> Bool {
        return depth.value < maxRecursiveDepth
    }

    private func resolve<T>(item: Item, scope: Scope) -> T? {
        if case .singleton = scope, let assembly = item.assembly as? T {
            return assembly
        }
        guard canContinue() else {
            return nil
        }
        incrementDepth()
        var assembly: T? = nil
        switch item.factory {
        case let .zero(factory as FabricZero<T>):
            assembly = factory(self)
        case let .empty(factory as Fabric<T>):
            assembly = factory()
        case let .one(factory as FabricZero<T>):
            assembly = factory(self)
        default:
            break
        }

        if case .singleton = scope {
            item.assembly = assembly
        }
        if let completion = item.completion as? FabricCompletion<T> {
            completion(self, assembly)
        }
        decrementDepth()
        return assembly
    }

    private func resolve<T, P>(item: Item, parameter: P, scope: Scope) -> T? {
        if case .singleton = scope, let assembly = item.assembly as? T {
            return assembly
        }
        guard canContinue() else {
            return nil
        }
        incrementDepth()
        var assembly: T? = nil
        if case let .one(factory as FabricOneParameter<T, P>) = item.factory {
            assembly = factory(self, parameter)
        }

        if case .singleton = scope {
            item.assembly = assembly
        }
        if let completion = item.completion as? FabricCompletion<T> {
            completion(self, assembly)
        }
        decrementDepth()
        return assembly
    }

    private func resolve<T, P1, P2>(item: Item, parameter1: P1, parameter2: P2, scope: Scope) -> T? {
        if case .singleton = scope, let assembly = item.assembly as? T {
            return assembly
        }
        guard canContinue() else {
            return nil
        }
        incrementDepth()
        var assembly: T? = nil
        if case let .two(factory as FabricTwoParameters<T, P1, P2>) = item.factory {
            assembly = factory(self, parameter1, parameter2)
        }

        if case .singleton = scope {
            item.assembly = assembly
        }
        if let completion = item.completion as? FabricCompletion<T> {
            completion(self, assembly)
        }
        decrementDepth()
        return assembly
    }

    private func resolve<T, P1, P2, P3>(item: Item, parameter1: P1, parameter2: P2, parameter3: P3, scope: Scope) -> T? {
        if case .singleton = scope, let assembly = item.assembly as? T {
            return assembly
        }
        guard canContinue() else {
            return nil
        }
        incrementDepth()
        var assembly: T? = nil
        if case let .three(factory as FabricThreeParameters<T, P1, P2, P3>) = item.factory {
            assembly = factory(self, parameter1, parameter2, parameter3)
        }

        if case .singleton = scope {
           item.assembly = assembly
        }
        if let completion = item.completion as? FabricCompletion<T> {
            completion(self, assembly)
        }
        decrementDepth()
        return assembly
    }

    private func resolve<T, P1, P2, P3>(_ protocolType: T.Type, parameter1: P1, parameter2: P2, parameter3: P3, scope: Scope) -> T? {
        let key = hashKey(types: [protocolType, P1.self, P2.self, P3.self])
        guard let item: Item = items[key] else {
            return nil
        }
        return resolve(item: item,
                       parameter1: parameter1,
                       parameter2: parameter2,
                       parameter3: parameter3, scope: scope)
    }

    private func resolve<T, P>(_ protocolType: T.Type, parameter: P, scope: Scope) -> T? {
        let key = hashKey(types: [protocolType, P.self])
        guard let item: Item = items[key] else {
            return nil
        }

        return resolve(item: item, parameter: parameter, scope: scope)
    }

    private func resolve<T, P1, P2>(_ protocolType: T.Type, parameter1: P1, parameter2: P2, scope: Scope) -> T? {
        let key = hashKey(types: [protocolType, P1.self, P2.self])
        guard let item: Item = items[key] else {
            return nil
        }
        return resolve(item: item, parameter1: parameter1, parameter2: parameter2, scope: scope)
    }

    private func resolve<T>(_ protocolType: T.Type, scope: Scope) -> T? {
        let key = hashKey(types: [protocolType])
        guard let item: Item = items[key] else {
            return nil
        }

        return resolve(item: item, scope: scope)
    }
}

private extension TuringDI {

    // MARK: - Types

    private enum Scope: TuringDIScopeProtocol {
        case new
        case singleton
    }
}
