//
//  TuringSafeArray+Accessing.swift
//  TuringSafe
//
//  Created by Dmitry Rybochkin on 15/04/2019.
//

import Foundation

extension TuringSafeArray {

    // MARK: - Properties

    public var first: Element? {
        return dispatchQueue.sync(flags: .barrier) {
            array.first
        }
    }

    public var last: Element? {
        return dispatchQueue.sync(flags: .barrier) {
            array.last
        }
    }

    // MARK: - Functions

    public subscript(position: Index) -> Element {
        return dispatchQueue.sync(flags: .barrier) {
            array[position]
        }
    }

    public subscript(bounds: Range<Index>) -> TuringSafeArray<Element> {
        return dispatchQueue.sync(flags: .barrier) {
            TuringSafeArray(array[bounds])
        }
    }

    public func randomElement() -> Element? {
        return dispatchQueue.sync(flags: .barrier) {
            array.randomElement()
        }
    }
}
