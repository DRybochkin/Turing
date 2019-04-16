//
//  TuringSafeDictionary+Reordering.swift
//  TuringSafe
//
//  Created by Dmitry Rybochkin on 15/04/2019.
//

import Foundation

extension TuringSafeDictionary {

    // MARK: - Functions

    public func reversed() -> [Element] {
        return dispatchQueue.sync(flags: .barrier) {
            dictionary.reversed()
        }
    }

    public func shuffled() -> TuringSafeDictionary<Key, Value> {
        return dispatchQueue.sync {
            TuringSafeDictionary<Key, Value>(dictionary: dictionary.shuffled())
        }
    }

    public func shuffled<T>(using generator: inout T) -> TuringSafeDictionary<Key, Value> where T: RandomNumberGenerator {
        return dispatchQueue.sync(flags: .barrier) {
            TuringSafeDictionary<Key, Value>(dictionary: dictionary.shuffled(using: &generator))
        }
    }
}

