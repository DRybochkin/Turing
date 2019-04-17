//
//  TuringSafeDictionary+Transforming.swift
//  TuringSafe
//
//  Created by Dmitry Rybochkin on 15/04/2019.
//

import Foundation

extension TuringSafeDictionary {

    // MARK: - Functions

    public func mapValues<T>(_ transform: (Value) throws -> T) rethrows -> TuringSafeDictionary<Key, T> {
        return try dispatchQueue.sync(flags: .barrier) {
            let elements = try dictionary.mapValues(transform)
            return TuringSafeDictionary<Key, T>(dictionary: elements)
        }
    }

    public func compactMapValues<T>(_ transform: (Value) throws -> T?) rethrows -> TuringSafeDictionary<Key, T> {
        return try dispatchQueue.sync(flags: .barrier) {
            let elements = try dictionary.compactMapValues(transform)
            return TuringSafeDictionary<Key, T>(dictionary: elements)
        }
    }

    public func mapValues<T>(_ transform: (Value) throws -> T) rethrows -> Dictionary<Key, T> {
        return try dispatchQueue.sync(flags: .barrier) {
            try dictionary.mapValues(transform)
        }
    }

    public func compactMapValues<T>(_ transform: (Value) throws -> T?) rethrows -> Dictionary<Key, T> {
        return try dispatchQueue.sync(flags: .barrier) {
            try dictionary.compactMapValues(transform)
        }
    }

    public func reduce<Result>(_ initialResult: Result, _ nextPartialResult: (Result, Element) throws -> Result) rethrows -> Result {
        return try dispatchQueue.sync(flags: .barrier) {
            try dictionary.reduce(initialResult, nextPartialResult)
        }
    }

    public func reduce<Result>(into initialResult: Result, _ updateAccumulatingResult: (inout Result, Element) throws -> ()) rethrows -> Result {
        return try dispatchQueue.sync(flags: .barrier) {
            try dictionary.reduce(into: initialResult, updateAccumulatingResult)
        }
    }

    public func map<T>(_ transform: (Element) throws -> T) rethrows -> [T] {
        return try dispatchQueue.sync(flags: .barrier) {
            try dictionary.map(transform)
        }
    }

    public func compactMap<ElementOfResult>(_ transform: (Element) throws -> ElementOfResult?) rethrows -> [ElementOfResult] {
        return try dispatchQueue.sync(flags: .barrier) {
            try dictionary.compactMap(transform)
        }
    }

    public func sorted(by areInIncreasingOrder: (Element, Element) throws -> Bool) rethrows -> [Element] {
        return try dispatchQueue.sync(flags: .barrier) {
            try dictionary.sorted(by: areInIncreasingOrder)
        }
    }
}
