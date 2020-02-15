//
//  TuringSafeDictionary+Iterating.swift
//  TuringSafe
//
//  Created by Dmitry Rybochkin on 15/04/2019.
//

import Foundation

extension TuringSafeDictionary {

    // MARK: - Properties

    public var underestimatedCount: Int {
        return dispatchQueue.sync(flags: .barrier) {
            dictionary.underestimatedCount
        }
    }

    public var lazy: LazySequence<DictionaryType> {
        return dispatchQueue.sync(flags: .barrier) {
            dictionary.lazy
        }
    }

    // MARK: - Functions

    public func forEach(_ body: @escaping (Element) throws -> Void) rethrows {
        dispatchQueue.sync(flags: .barrier) {
            try? dictionary.forEach(body)
        }
    }

    public func makeIterator() -> DictionaryType.Iterator {
        return dispatchQueue.sync(flags: .barrier) {
            dictionary.makeIterator()
        }
    }

    public func enumerated() -> EnumeratedSequence<DictionaryType> {
        return dispatchQueue.sync(flags: .barrier) {
            dictionary.enumerated()
        }
    }
}
