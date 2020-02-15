//
//  TuringSafeDictionary+Accessing.swift
//  TuringSafe
//
//  Created by Dmitry Rybochkin on 15/04/2019.
//

import Foundation

extension TuringSafeDictionary {

    // MARK: - Properties

    public subscript(key: Key) -> Value? {
        get {
            return dispatchQueue.sync(flags: .barrier) {
                dictionary[key]
            }
        }
        set {
            return dispatchQueue.async(flags: .barrier) { [weak self] in
                self?.dictionary[key] = newValue
            }
        }
    }

    public subscript(key: Key, default defaultValue: @autoclosure () -> Value) -> Value {
        get {
            return dispatchQueue.sync(flags: .barrier) {
                dictionary[key] ?? defaultValue()
            }
        }
        set {
            return dispatchQueue.async(flags: .barrier) { [weak self] in
                self?.dictionary[key] = newValue
            }
        }
    }

    public var keys: DictionaryType.Keys {
        return dispatchQueue.sync(flags: .barrier) {
            dictionary.keys
        }
    }

    public var values: DictionaryType.Values {
        get {
            return dispatchQueue.sync(flags: .barrier) {
                dictionary.values
            }
        }
        set {
            return dispatchQueue.async(flags: .barrier) { [weak self] in
                self?.dictionary.values = newValue
            }
        }
    }

    public var first: Element? {
        return dispatchQueue.sync(flags: .barrier) {
            dictionary.first
        }
    }

    // MARK: - Functions

    public func index(forKey key: Key) -> Index? {
        return dispatchQueue.sync(flags: .barrier) {
            dictionary.index(forKey: key)
        }
    }

    public subscript(position: Index) -> Iterator.Element {
        return dispatchQueue.sync(flags: .barrier) {
            dictionary[position]
        }
    }

    public subscript(bounds: Range<Index>) -> SubSequence {
        return dispatchQueue.sync(flags: .barrier) {
            dictionary[bounds]
        }
    }

    public func randomElement() -> Element? {
        return dispatchQueue.sync(flags: .barrier) {
            dictionary.randomElement()
        }
    }

    public func randomElement<T>(using generator: inout T) -> Element? where T: RandomNumberGenerator {
        return dispatchQueue.sync(flags: .barrier) {
            dictionary.randomElement(using: &generator)
        }
    }
}
