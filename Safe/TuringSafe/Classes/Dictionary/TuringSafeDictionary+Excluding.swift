//
//  TuringSafeDictionary+Excluding.swift
//  TuringSafe
//
//  Created by Dmitry Rybochkin on 15/04/2019.
//

import Foundation

extension TuringSafeDictionary {

    // MARK: - Functions

    public func dropFirst(_ count: Int = 1) -> TuringSafeDictionary<Key, Value> {
        return dispatchQueue.sync(flags: .barrier) {
            TuringSafeDictionary(dictionary: dictionary.dropFirst(count))
        }
    }

    public func dropLast(_ count: Int = 1) -> TuringSafeDictionary<Key, Value> {
        return dispatchQueue.sync(flags: .barrier) {
            TuringSafeDictionary(dictionary: dictionary.dropLast(count))
        }
    }

    public func drop(while predicate: (Element) throws -> Bool) rethrows -> TuringSafeDictionary<Key, Value> {
        return try dispatchQueue.sync(flags: .barrier) {
            let elements = try dictionary.drop(while: predicate)
            return TuringSafeDictionary(dictionary: elements)
        }
    }
}
