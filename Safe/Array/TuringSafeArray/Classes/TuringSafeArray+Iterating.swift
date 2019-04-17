//
//  TuringSafeArray+Iterating.swift
//  TuringSafe
//
//  Created by Dmitry Rybochkin on 15/04/2019.
//

import Foundation

extension TuringSafeArray {

    // MARK: - Properties

    public var underestimatedCount: Int {
        return dispatchQueue.sync(flags: .barrier) {
            array.underestimatedCount
        }
    }

    // MARK: - Functions

    public func forEach(_ body: @escaping (Element) throws -> Void) rethrows {
        dispatchQueue.sync(flags: .barrier) {
            try? array.forEach(body)
        }
    }

    public func makeIterator() -> IndexingIterator<Array<Element>> {
        return dispatchQueue.sync(flags: .barrier) {
            array.makeIterator()
        }
    }
}
