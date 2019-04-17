//
//  TuringSafeArray+Finding.swift
//  TuringSafe
//
//  Created by Dmitry Rybochkin on 15/04/2019.
//

import Foundation

extension TuringSafeArray where Element: Equatable {

    // MARK: - Equatable Functions

    public func contains(_ element: Element) -> Bool {
        return dispatchQueue.sync(flags: .barrier) {
            array.contains(element)
        }
    }

    public func contains(where predicate: (Element) throws -> Bool) rethrows -> Bool {
        return try dispatchQueue.sync(flags: .barrier) {
            try array.contains(where: predicate)
        }
    }

    public func allSatisfy(_ predicate: (Element) throws -> Bool) rethrows -> Bool {
        return try dispatchQueue.sync(flags: .barrier) {
            try array.allSatisfy(predicate)
        }
    }

    public func first(where predicate: (Element) throws -> Bool) rethrows -> Element? {
        return try dispatchQueue.sync(flags: .barrier) {
            try array.first(where: predicate)
        }
    }

    public func firstIndex(of element: Element) -> Index? {
        return dispatchQueue.sync(flags: .barrier) {
            array.firstIndex(of: element)
        }
    }

    public func firstIndex(where predicate: (Element) throws -> Bool) rethrows -> Index? {
        return try dispatchQueue.sync(flags: .barrier) {
            try array.firstIndex(where: predicate)
        }
    }

    public func last(where predicate: (Element) throws -> Bool) rethrows -> Element? {
        return try dispatchQueue.sync(flags: .barrier) {
            try array.last(where: predicate)
        }
    }

    public func lastIndex(of element: Element) -> Index? {
        return dispatchQueue.sync(flags: .barrier) {
            array.lastIndex(of: element)
        }
    }

    public func lastIndex(where predicate: (Element) throws -> Bool) rethrows -> Index? {
        return try dispatchQueue.sync(flags: .barrier) {
            try array.lastIndex(where: predicate)
        }
    }
}

extension TuringSafeArray where Element: Comparable {

    // MARK: - Comparable fucntions

    public func min() -> Element? {
        return dispatchQueue.sync(flags: .barrier) {
            array.min()
        }
    }

    public func max() -> Element? {
        return dispatchQueue.sync(flags: .barrier) {
            array.max()
        }
    }
}

extension TuringSafeArray {

    // MARK: - Functions

    @warn_unqualified_access
    public func min(by areInIncreasingOrder: (Element, Element) throws -> Bool) rethrows -> Element? {
        return try dispatchQueue.sync(flags: .barrier) {
            try array.min(by: areInIncreasingOrder)
        }
    }

    @warn_unqualified_access
    public func max(by areInIncreasingOrder: (Element, Element) throws -> Bool) rethrows -> Element? {
        return try dispatchQueue.sync(flags: .barrier) {
            try array.max(by: areInIncreasingOrder)
        }
    }
}
