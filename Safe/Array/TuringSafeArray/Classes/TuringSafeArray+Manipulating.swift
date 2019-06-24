//
//  TuringSafeArray+Manipulating.swift
//  TuringSafe
//
//  Created by Dmitry Rybochkin on 15/04/2019.
//

import Foundation

extension TuringSafeArray {

    // MARK: - Properties

    public var indices: Indices {
        return dispatchQueue.sync(flags: .barrier) {
            array.indices
        }
    }

    public var startIndex: Index {
        return dispatchQueue.sync(flags: .barrier) {
            array.startIndex
        }
    }

    public var endIndex: ArrayType.Index {
        return dispatchQueue.sync(flags: .barrier) {
            array.endIndex
        }
    }

    // MARK: - Functions

    public func index(after index: Index) -> Index {
        return dispatchQueue.sync(flags: .barrier) {
            array.index(after: index)
        }
    }

    public func index(before index: Index) -> Index {
        return dispatchQueue.sync(flags: .barrier) {
            array.index(before: index)
        }
    }

    public func index(_ index: Index, offsetBy: Index) -> Index {
        return dispatchQueue.sync(flags: .barrier) {
            array.index(index, offsetBy: offsetBy)
        }
    }

    public func index(_ index: Index, offsetBy: Index, limitedBy: Index) -> Index? {
        return dispatchQueue.sync(flags: .barrier) {
            array.index(index, offsetBy: offsetBy, limitedBy: limitedBy)
        }
    }

    public func formIndex(before index: inout Index) {
        return dispatchQueue.sync(flags: .barrier) {
            array.formIndex(before: &index)
        }
    }

    public func formIndex(after index: inout Index) {
        return dispatchQueue.sync(flags: .barrier) {
            array.formIndex(after: &index)
        }
    }

    public func distance(from start: Index, to end: Index) -> Index {
        return dispatchQueue.sync(flags: .barrier) {
            array.distance(from: start, to: end)
        }
    }
}
