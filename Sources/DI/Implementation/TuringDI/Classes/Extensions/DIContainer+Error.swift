//
//  DIContainer+Error.swift
//  TuringDI
//
//  Created by Dmitry Rybochkin on 23/04/2019.
//  Copyright (c) 2019 Dmitry Rybochkin. All rights reserved.
//

import Foundation

extension DIContainer {

    // MARK: - Functions

    func checkResolution(item: Item, assembly: Any?, scope: Scope) {
        #if !DEBUG
        return
        #endif
        guard assembly == nil else {
            return
        }
        print("resolution failed with factory not found error")
        print("scope: \(scope)")
        print("sought-for factory:")
        print("\(item)")
        let items = getItems(item.protocolType)
        guard !items.isEmpty else {
            return
        }
        print("possible factories:")
        print("\(items)")
    }

    func recursiveError(item: Item, scope: Scope) {
        #if !DEBUG
        return
        #endif
        print("resolution failed with recursive error")
        print("scope: \(scope)")
        print("depth: \(depth)")
        print("using factory:")
        print("\(item)")
    }

    func resolutionError(_ protocolType: Any.Type, types: [Any.Type], scope: Scope) {
        #if !DEBUG
        return
        #endif
        let item = Item(protocolType: protocolType, types: types, factory: .empty({}), completion: nil)
        checkResolution(item: item, assembly: nil, scope: scope)
    }
}

private extension DIContainer {

    // MARK: - Private functions

    private func getItems(_ protocolType: Any.Type) -> [Item] {
        let key = hashKey(types: [protocolType])
        return items.sync({ $0.compactMap({ $0.key.starts(with: key) ? $0.value : nil }) })
    }
}
