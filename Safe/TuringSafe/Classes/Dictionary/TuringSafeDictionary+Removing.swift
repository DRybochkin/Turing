//
//  TuringSafeDictionary+Removing.swift
//  TuringSafe
//
//  Created by Dmitry Rybochkin on 15/04/2019.
//

import Foundation

extension TuringSafeDictionary {

    // MARK: - Functions

    @discardableResult
    public func filter(_ isIncluded: (Element) throws -> Bool) rethrows -> [Key: Value] {
        return try dispatchQueue.sync(flags: .barrier) {
            try dictionary.filter(isIncluded)
        }
    }

    @discardableResult
    public func removeValue(forKey key: Key) -> Value? {
        return dispatchQueue.sync(flags: .barrier) {
            dictionary.removeValue(forKey: key)
        }
    }

    @discardableResult
    public func remove(at index: Index) -> Element {
        return dispatchQueue.sync(flags: .barrier) {
            dictionary.remove(at: index)
        }
    }

    public func removeAll(keepingCapacity keepCapacity: Bool) {
        dispatchQueue.async(flags: .barrier) { [weak self] in
            self?.dictionary.removeAll(keepingCapacity: keepCapacity)
        }
    }

    public func removeAll() {
        dispatchQueue.async(flags: .barrier) { [weak self] in
            self?.dictionary.removeAll()
        }
    }

    public func popFirst() -> Element? {
        return dispatchQueue.sync(flags: .barrier) {
            dictionary.popFirst()
        }
    }
}
