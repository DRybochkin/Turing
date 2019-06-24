//
//  TuringSafeArray+Adding.swift
//  TuringSafe
//
//  Created by Dmitry Rybochkin on 15/04/2019.
//

import Foundation

extension TuringSafeArray {

    // MARK: - Functions

    public func append(_ newElement: Value) {
        dispatchQueue.async(flags: .barrier) { [weak self] in
            self?.array.append(newElement)
        }
    }

    public func insert(_ newElement: Value, at index: Index) {
        dispatchQueue.async(flags: .barrier) { [weak self] in
            self?.array.insert(newElement, at: index)
        }
    }

    public func insert<S>(contentsOf newElements: S, at index: Index) where S: Collection, Value == S.Element {
        dispatchQueue.async(flags: .barrier) { [weak self] in
            self?.array.insert(contentsOf: newElements, at: index)
        }
    }

    //swiftlint:disable:next line_length
    public func replaceSubrange<C>(_ subrange: Range<Int>, with newElements: C) where Value == C.Element, C: Collection {
        dispatchQueue.async(flags: .barrier) { [weak self] in
            self?.array.replaceSubrange(subrange, with: newElements)
        }
    }

    //swiftlint:disable:next line_length
    public func replaceSubrange<C, R>(_ subrange: R, with newElements: C) where C: Collection, R: RangeExpression, Value == C.Element, Index == R.Bound {
        dispatchQueue.async(flags: .barrier) { [weak self] in
            self?.array.replaceSubrange(subrange, with: newElements)
        }
    }

    public func reserveCapacity(_ count: Int) {
        dispatchQueue.async(flags: .barrier) { [weak self] in
            self?.array.reserveCapacity(count)
        }
    }

    public static func += (lhs: inout TuringSafeArray<Element>, rhs: Element) {
        lhs.append(rhs)
    }

    public static func += (lhs: inout TuringSafeArray<Element>, rhs: TuringSafeArray<Element>) {
        lhs.append(contentsOf: rhs)
    }
}
