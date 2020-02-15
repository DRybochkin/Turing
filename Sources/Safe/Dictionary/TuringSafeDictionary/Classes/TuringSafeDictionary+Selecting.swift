//
//  TuringSafeDictionary+Selecting.swift
//  TuringSafe
//
//  Created by Dmitry Rybochkin on 15/04/2019.
//

import Foundation

extension TuringSafeDictionary {

    // MARK: - Functions

    public func filter(_ isIncluded: (Element) throws -> Bool) rethrows -> TuringSafeDictionary<Key, Value> {
        return try dispatchQueue.sync(flags: .barrier) {
            let values = try dictionary.filter(isIncluded)
            return TuringSafeDictionary<Key, Value>(dictionary: values)
        }
    }

    public func prefix(_ maxLength: Int) -> TuringSafeDictionary<Key, Value> {
        return dispatchQueue.sync(flags: .barrier) {
            return TuringSafeDictionary(dictionary: dictionary.prefix(maxLength))
        }
    }

    public func prefix(through position: Index) -> TuringSafeDictionary<Key, Value> {
        return dispatchQueue.sync(flags: .barrier) {
            TuringSafeDictionary(dictionary: dictionary.prefix(through: position))
        }
    }

    public func prefix(upTo end: Index) -> TuringSafeDictionary<Key, Value> {
        return dispatchQueue.sync(flags: .barrier) {
            TuringSafeDictionary(dictionary: dictionary.prefix(upTo: end))
        }
    }

    public func prefix(while predicate: (Element) throws -> Bool) rethrows -> TuringSafeDictionary<Key, Value> {
        return try dispatchQueue.sync(flags: .barrier) {
            try TuringSafeDictionary(dictionary: dictionary.prefix(while: predicate))
        }
    }

    public func suffix(_ maxLength: Int) -> TuringSafeDictionary<Key, Value> {
        return dispatchQueue.sync(flags: .barrier) {
            TuringSafeDictionary(dictionary: dictionary.suffix(maxLength))
        }
    }

    public func suffix(from start: Index) -> TuringSafeDictionary<Key, Value> {
        return dispatchQueue.sync(flags: .barrier) {
            TuringSafeDictionary(dictionary: dictionary.suffix(from: start))
        }
    }

    @discardableResult
    public func filter(_ isIncluded: (Element) throws -> Bool) rethrows -> [Key: Value] {
        return try dispatchQueue.sync(flags: .barrier) {
            try dictionary.filter(isIncluded)
        }
    }
}
