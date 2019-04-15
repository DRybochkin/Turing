//
//  TuringSafeArray+Selecting.swift
//  TuringSafe
//
//  Created by Dmitry Rybochkin on 15/04/2019.
//

import Foundation

extension TuringSafeArray {

    // MARK: - Functions

    public func filter(_ isIncluded: (Element) throws -> Bool) rethrows -> TuringSafeArray<Element> {
        return try dispatchQueue.sync(flags: .barrier) {
            let values = try array.filter(isIncluded)
            return TuringSafeArray<Value>(values)
        }
    }

    public func prefix(_ maxLength: Int) -> TuringSafeArray<Element> {
        return dispatchQueue.sync(flags: .barrier) {
            TuringSafeArray(array.prefix(maxLength))
        }
    }

    public func prefix(through position: Int) -> TuringSafeArray<Element> {
        return dispatchQueue.sync(flags: .barrier) {
            TuringSafeArray(array.prefix(through: position))
        }
    }

    public func prefix(upTo end: Int) -> TuringSafeArray<Element> {
        return dispatchQueue.sync(flags: .barrier) {
            TuringSafeArray(array.prefix(upTo: end))
        }
    }

    public func prefix(while predicate: (Element) throws -> Bool) rethrows -> TuringSafeArray<Element> {
        return try dispatchQueue.sync(flags: .barrier) {
            try TuringSafeArray(array.prefix(while: predicate))
        }
    }

    public func suffix(_ maxLength: Int) -> TuringSafeArray<Element> {
        return dispatchQueue.sync(flags: .barrier) {
            TuringSafeArray(array.suffix(maxLength))
        }
    }

    public func suffix(from start: Int) -> TuringSafeArray<Element> {
        return dispatchQueue.sync(flags: .barrier) {
            TuringSafeArray(array.suffix(from: start))
        }
    }
}
