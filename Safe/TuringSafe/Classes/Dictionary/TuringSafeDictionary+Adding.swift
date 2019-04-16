//
//  TuringSafeDictionary+Adding.swift
//  TuringSafe
//
//  Created by Dmitry Rybochkin on 15/04/2019.
//

import Foundation

extension TuringSafeDictionary {

    // MARK: - Functions

    @discardableResult
    public func updateValue(_ value: Value, forKey key: Key) -> Value? {
        return dispatchQueue.sync(flags: .barrier) {
            dictionary.updateValue(value, forKey: key)
        }
    }

    public func merge(_ other: [Key: Value], uniquingKeysWith combine: @escaping (Value, Value) throws -> Value) rethrows {
        return dispatchQueue.async(flags: .barrier) { [weak self] in
            try? self?.dictionary.merge(other, uniquingKeysWith: combine)
        }
    }

    public func merge<S>(_ other: S, uniquingKeysWith combine: @escaping (Value, Value) throws -> Value) rethrows where S: Sequence, S.Element == (Key, Value) {
        return dispatchQueue.async(flags: .barrier) { [weak self] in
            try? self?.dictionary.merge(other, uniquingKeysWith: combine)
        }
    }

    public func merging(_ other: [Key : Value], uniquingKeysWith combine: (Value, Value) throws -> Value) rethrows -> [Key: Value] {
        return try dispatchQueue.sync(flags: .barrier) {
            try dictionary.merging(other, uniquingKeysWith: combine)
        }
    }

    public func merging<S>(_ other: S, uniquingKeysWith combine: (Value, Value) throws -> Value) rethrows -> [Key: Value] where S: Sequence, S.Element == (Key, Value) {
        return try dispatchQueue.sync(flags: .barrier) {
            try dictionary.merging(other, uniquingKeysWith: combine)
        }
    }

    public func reserveCapacity(_ count: Int) {
        dispatchQueue.async(flags: .barrier) { [weak self] in
            self?.dictionary.reserveCapacity(count)
        }
    }
}
