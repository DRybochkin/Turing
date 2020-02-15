//
//  TuringSafeDictionary+Manipulating.swift
//  TuringSafe
//
//  Created by Dmitry Rybochkin on 15/04/2019.
//

import Foundation

extension TuringSafeDictionary {

    // MARK: - Properties

    public var indices: Indices {
        return dispatchQueue.sync(flags: .barrier) {
            dictionary.indices
        }
    }

    public var startIndex: Index {
        return dispatchQueue.sync(flags: .barrier) {
            dictionary.startIndex
        }
    }

    public var endIndex: Index {
        return dispatchQueue.sync(flags: .barrier) {
            dictionary.endIndex
        }
    }

    // MARK: - Functions

    public func index(after index: Index) -> Index {
        return dispatchQueue.sync(flags: .barrier) {
            dictionary.index(after: index)
        }
    }

    public func index(_ index: Index, offsetBy: Int) -> Index {
        return dispatchQueue.sync(flags: .barrier) {
            dictionary.index(index, offsetBy: offsetBy)
        }
    }

    public func index(_ index: Index, offsetBy: Int, limitedBy: Index) -> Index? {
        return dispatchQueue.sync(flags: .barrier) {
            dictionary.index(index, offsetBy: offsetBy, limitedBy: limitedBy)
        }
    }

    public func formIndex(after index: inout Index) {
        return dispatchQueue.sync(flags: .barrier) {
            dictionary.formIndex(after: &index)
        }
    }

    public func distance(from start: Index, to end: Index) -> Int {
        return dispatchQueue.sync(flags: .barrier) {
            dictionary.distance(from: start, to: end)
        }
    }
}
