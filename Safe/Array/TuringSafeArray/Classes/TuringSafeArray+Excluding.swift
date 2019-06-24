//
//  TuringSafeArray+Excluding.swift
//  TuringSafe
//
//  Created by Dmitry Rybochkin on 15/04/2019.
//

import Foundation

extension TuringSafeArray {

    // MARK: - Functions

    public func dropFirst(_ count: Int = 1) -> TuringSafeArray<Element> {
        return dispatchQueue.sync(flags: .barrier) {
            TuringSafeArray(array.dropFirst(count))
        }
    }

    public func dropLast(_ count: Int = 1) -> TuringSafeArray<Element> {
        return dispatchQueue.sync(flags: .barrier) {
            TuringSafeArray(array.dropLast(count))
        }
    }

    public func drop(while predicate: (Element) throws -> Bool) rethrows -> TuringSafeArray<Element> {
        return try dispatchQueue.sync(flags: .barrier) {
            let elements = try array.drop(while: predicate)
            return TuringSafeArray(elements)
        }
    }
}
