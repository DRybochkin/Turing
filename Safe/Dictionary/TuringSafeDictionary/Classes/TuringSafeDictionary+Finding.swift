//
//  TuringSafeDictionary+Finding.swift
//  TuringSafe
//
//  Created by Dmitry Rybochkin on 15/04/2019.
//

import Foundation

extension TuringSafeDictionary where Key: Equatable, Value: Equatable {

    // MARK: - Equatable Functions

    public func contains(where predicate: (Element) throws -> Bool) rethrows -> Bool {
        return try dispatchQueue.sync(flags: .barrier) {
            try dictionary.contains(where: predicate)
        }
    }

    public func allSatisfy(_ predicate: (Element) throws -> Bool) rethrows -> Bool {
        return try dispatchQueue.sync(flags: .barrier) {
            try dictionary.allSatisfy(predicate)
        }
    }

    public func first(where predicate: (Element) throws -> Bool) rethrows -> Element? {
        return try dispatchQueue.sync(flags: .barrier) {
            try dictionary.first(where: predicate)
        }
    }

    public func firstIndex(where predicate: (Element) throws -> Bool) rethrows -> Index? {
        return try dispatchQueue.sync(flags: .barrier) {
            try dictionary.firstIndex(where: predicate)
        }
    }
}

extension TuringSafeDictionary where Key: Comparable, Value: Comparable {

    // MARK: - Comparable fucntions

    @warn_unqualified_access
    public func min(by areInIncreasingOrder: (Element, Element) throws -> Bool) rethrows -> Element? {
        return try dispatchQueue.sync(flags: .barrier) {
            try dictionary.min(by: areInIncreasingOrder)
        }
    }

    @warn_unqualified_access
    public func max(by areInIncreasingOrder: (Element, Element) throws -> Bool) rethrows -> Element? {
        return try dispatchQueue.sync(flags: .barrier) {
            try dictionary.max(by: areInIncreasingOrder)
        }
    }
}
