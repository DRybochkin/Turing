//
//  DIContainer+AnyResolve.swift
//  TuringDI
//
//  Created by Dmitry Rybochkin on 23/04/2019.
//  Copyright (c) 2019 Dmitry Rybochkin. All rights reserved.
//

import Foundation

extension DIContainer {

    // MARK: - Functions

    //swiftlint:disable:next function_body_length
    func resolveAnyItem<T, P1, P2, P3>(_ protocolType: T.Type,
                                       _ parameter1: P1?,
                                       _ parameter2: P2?,
                                       _ parameter3: P3?,
                                       scope: Scope) -> T? {
        guard let item = getAnyItem(types: [protocolType, P1.self, P2.self, P3.self]) else {
            resolutionError(protocolType, types: [P1.self, P2.self, P3.self], scope: scope)
            return nil
        }
        if item.isAnyType(in: 0), item.isAnyType(in: 1), item.isAnyType(in: 2) {
            return resolve(protocolType,
                           parameter1 as Any,
                           parameter2 as Any,
                           parameter3 as Any,
                           scope: scope)
        } else if item.isAnyType(in: 0), item.isAnyType(in: 1) {
            return resolve(protocolType,
                           parameter1 as Any,
                           parameter2 as Any,
                           parameter3,
                           scope: scope)
        } else if item.isAnyType(in: 0), item.isAnyType(in: 2) {
            return resolve(protocolType,
                           parameter1 as Any,
                           parameter2,
                           parameter3 as Any,
                           scope: scope)
        } else if item.isAnyType(in: 1), item.isAnyType(in: 2) {
            return resolve(protocolType,
                           parameter1 as Any,
                           parameter2,
                           parameter3 as Any,
                           scope: scope)
        } else if item.isAnyType(in: 0) {
            return resolve(protocolType,
                           parameter1 as Any,
                           parameter2,
                           parameter3,
                           scope: scope)
        } else if item.isAnyType(in: 1) {
            return resolve(protocolType,
                           parameter1,
                           parameter2 as Any,
                           parameter3,
                           scope: scope)
        } else if item.isAnyType(in: 2) {
            return resolve(protocolType,
                           parameter1,
                           parameter2,
                           parameter3 as Any,
                           scope: scope)
        }
        checkResolution(item: item, assembly: nil, scope: scope)
        return nil
    }

    func resolveAnyItem<T, P1, P2>(_ protocolType: T.Type,
                                   _ parameter1: P1?,
                                   _ parameter2: P2?,
                                   scope: Scope) -> T? {
        guard let item = getAnyItem(types: [protocolType, P1.self, P2.self]) else {
            resolutionError(protocolType, types: [P1.self, P2.self], scope: scope)
            return nil
        }
        if item.isAnyType(in: 0), item.isAnyType(in: 1) {
            return resolve(protocolType,
                           parameter1 as Any,
                           parameter2 as Any,
                           scope: scope)
        } else if item.isAnyType(in: 0) {
            return resolve(protocolType,
                           parameter1 as Any,
                           parameter2,
                           scope: scope)
        } else if item.isAnyType(in: 1) {
            return resolve(protocolType,
                           parameter1,
                           parameter2 as Any,
                           scope: scope)
        }
        checkResolution(item: item, assembly: nil, scope: scope)
        return nil
    }

    func resolveAnyItem<T, P1>(_ protocolType: T.Type, _ parameter: P1?, scope: Scope) -> T? {
        guard let item = getAnyItem(types: [protocolType, P1.self]) else {
            resolutionError(protocolType, types: [P1.self], scope: scope)
            return nil
        }
        if item.isAnyType(in: 0) {
            return resolve(protocolType,
                           parameter as Any,
                           scope: scope)
        }
        checkResolution(item: item, assembly: nil, scope: scope)
        return nil
    }
}

private extension DIContainer {

    // MARK: - Private functions

    private func getAnyItem(types: [Any.Type]) -> Item? {
        let tree: TernaryTreeProtocol = TernaryTree(values: types)
        var keys: [String] = []
        tree.traversals(values: [], process: { newTypes in
            let key = hashKey(types: newTypes)
            keys.append(key)
        })

        return items.sync({ $0.first(where: { keys.contains($0.key) })?.value })
    }
}
