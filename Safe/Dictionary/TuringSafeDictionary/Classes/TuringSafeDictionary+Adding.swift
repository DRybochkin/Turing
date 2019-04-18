//
//  TuringSafeDictionary+Adding.swift
//  TuringSafe
//
//  Created by Dmitry Rybochkin on 15/04/2019.
//

import Foundation

extension TuringSafeDictionary {

    // MARK: - Functions

    //swiftlint:disable:next line_length
    public func merge(_ other: TuringSafeDictionary<Key, Value>, uniquingKeysWith combine: @escaping (Value, Value) throws -> Value) rethrows {
        return dispatchQueue.async(flags: .barrier) { [weak self] in
            other.dispatchQueue.suspend()
            try? self?.dictionary.merge(other.dictionary, uniquingKeysWith: combine)
            other.dispatchQueue.resume()
        }
    }

    //swiftlint:disable:next line_length
    public func merging(_ other: TuringSafeDictionary<Key, Value>, uniquingKeysWith combine: (Value, Value) throws -> Value) rethrows -> TuringSafeDictionary<Key, Value> {
        return try dispatchQueue.sync(flags: .barrier) {
            other.dispatchQueue.suspend()
            let mergeDictionary = try dictionary.merging(other.dictionary, uniquingKeysWith: combine)
            let result = TuringSafeDictionary<Key, Value>(dictionary: mergeDictionary)
            other.dispatchQueue.resume()
            return result
        }
    }

    //swiftlint:disable:next line_length
    public func merging<S>(_ other: S, uniquingKeysWith combine: (Value, Value) throws -> Value) rethrows -> TuringSafeDictionary<Key, Value> where S: Sequence, S.Element == (Key, Value) {
        return try dispatchQueue.sync(flags: .barrier) {
            let mergeDictionary = try dictionary.merging(other, uniquingKeysWith: combine)
            return TuringSafeDictionary<Key, Value>(dictionary: mergeDictionary)
        }
    }

    //swiftlint:disable:next line_length
    public func merging(_ other: [Key: Value], uniquingKeysWith combine: (Value, Value) throws -> Value) rethrows -> TuringSafeDictionary<Key, Value> {
        return try dispatchQueue.sync(flags: .barrier) {
            let result = try dictionary.merging(other, uniquingKeysWith: combine)
            return TuringSafeDictionary<Key, Value>(dictionary: result)
        }
    }

    @discardableResult
    public func updateValue(_ value: Value, forKey key: Key) -> Value? {
        return dispatchQueue.sync(flags: .barrier) {
            dictionary.updateValue(value, forKey: key)
        }
    }

    //swiftlint:disable:next line_length
    public func merge(_ other: [Key: Value], uniquingKeysWith combine: @escaping (Value, Value) throws -> Value) rethrows {
        return dispatchQueue.async(flags: .barrier) { [weak self] in
            try? self?.dictionary.merge(other, uniquingKeysWith: combine)
        }
    }

    //swiftlint:disable:next line_length
    public func merge<S>(_ other: S, uniquingKeysWith combine: @escaping (Value, Value) throws -> Value) rethrows where S: Sequence, S.Element == (Key, Value) {
        return dispatchQueue.async(flags: .barrier) { [weak self] in
            try? self?.dictionary.merge(other, uniquingKeysWith: combine)
        }
    }

    //swiftlint:disable:next line_length
    public func merging(_ other: [Key: Value], uniquingKeysWith combine: (Value, Value) throws -> Value) rethrows -> [Key: Value] {
        return try dispatchQueue.sync(flags: .barrier) {
            try dictionary.merging(other, uniquingKeysWith: combine)
        }
    }

    //swiftlint:disable:next line_length
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
