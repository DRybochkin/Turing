//
//  TuringSafeArray+Removing.swift
//  TuringSafe
//
//  Created by Dmitry Rybochkin on 15/04/2019.
//

import Foundation

extension TuringSafeArray {

    // MARK: - Functions

    @discardableResult
    public func remove(at index: Index) -> Value? {
        return dispatchQueue.sync(flags: .barrier) {
            0..<array.count ~= index ? array.remove(at: index) : nil
        }
    }

    @discardableResult
    public func removeFirst() -> Value? {
        return dispatchQueue.sync(flags: .barrier) {
            array.isEmpty ? nil : array.removeFirst()
        }
    }

    public func removeFirst(_ count: Int) {
        dispatchQueue.async(flags: .barrier) { [weak self] in
            self?.array.removeFirst(count)
        }
    }

    @discardableResult
    public func removeLast() -> Value? {
        return dispatchQueue.sync(flags: .barrier) {
            array.isEmpty ? nil : array.removeLast()
        }
    }

    public func removeLast(_ count: Int) {
        dispatchQueue.async(flags: .barrier) { [weak self] in
            guard let self = self, self.array.count >= count else {
                return
            }
            self.array.removeLast(count)
        }
    }

    public func removeSubrange(_ bounds: Range<Int>) {
        dispatchQueue.async(flags: .barrier) { [weak self] in
            self?.array.removeSubrange(bounds)
        }
    }

    public func removeSubrange<R>(_ bounds: R) where R: RangeExpression, Index == R.Bound {
        dispatchQueue.async(flags: .barrier) { [weak self] in
            self?.array.removeSubrange(bounds)
        }
    }

    public func removeAll(where shouldBeRemoved: @escaping (Value) throws -> Bool) rethrows {
        dispatchQueue.async(flags: .barrier) { [weak self] in
            try? self?.array.removeAll(where: shouldBeRemoved)
        }
    }

    public func removeAll(keepingCapacity keepCapacity: Bool) {
        dispatchQueue.async(flags: .barrier) { [weak self] in
            self?.array.removeAll(keepingCapacity: keepCapacity)
        }
    }

    public func removeAll() {
        dispatchQueue.async(flags: .barrier) {
            self.array.removeAll()
        }
    }

    public func popLast() -> Value? {
        return dispatchQueue.sync(flags: .barrier) {
            array.isEmpty ? nil : array.popLast()
        }
    }
}
