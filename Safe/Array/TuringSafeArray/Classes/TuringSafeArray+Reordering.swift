//
//  TuringSafeArray+Reordering.swift
//  TuringSafe
//
//  Created by Dmitry Rybochkin on 15/04/2019.
//

import Foundation

extension TuringSafeArray where Element: Comparable {

    // MARK: - Functions

    public func sort() {
        dispatchQueue.async(flags: .barrier) {
            self.array.sort()
        }
    }

    public func sorted() -> TuringSafeArray<Element> {
        var result: TuringSafeArray<Element> = []
        dispatchQueue.sync(flags: .barrier) {
            result = TuringSafeArray<Element>(array.sorted())
        }
        return result
    }

}

extension TuringSafeArray {

    // MARK: - Functions

    public func sort(by areInIncreasingOrder: @escaping (Element, Element) throws -> Bool) rethrows {
        dispatchQueue.async(flags: .barrier) { [weak self] in
            try? self?.array.sort(by: areInIncreasingOrder)
        }
    }

    //swiftlint:disable:next line_length
    public func sorted(by areInIncreasingOrder: (Element, Element) throws -> Bool) rethrows -> TuringSafeArray<Element> {
        return try dispatchQueue.sync(flags: .barrier) {
            try TuringSafeArray<Element>(array.sorted(by: areInIncreasingOrder))
        }
    }

    public func reverse() {
        dispatchQueue.async(flags: .barrier) { [weak self] in
            self?.array.reverse()
        }
    }

    public func shuffle() {
        dispatchQueue.async(flags: .barrier) { [weak self] in
            self?.array.shuffle()
        }
    }

    public func shuffle<T>(using generator: inout T) where T: RandomNumberGenerator {
        dispatchQueue.sync(flags: .barrier) {
            array.shuffle(using: &generator)
        }
    }

    public func shuffled() -> TuringSafeArray<Element> {
        return dispatchQueue.sync {
            TuringSafeArray<Element>(array.shuffled())
        }
    }

    public func shuffled<T>(using generator: inout T) -> TuringSafeArray<Element> where T: RandomNumberGenerator {
        return dispatchQueue.sync(flags: .barrier) {
            TuringSafeArray<Element>(array.shuffled(using: &generator))
        }
    }

    public func partition(by belongsInSecondPartition: (Element) throws -> Bool) rethrows -> Int {
        return try dispatchQueue.sync(flags: .barrier) {
            try array.partition(by: belongsInSecondPartition)
        }
    }

    public func swapAt(_ indexI: Int, _ indexJ: Int) {
        dispatchQueue.async(flags: .barrier) { [weak self] in
            self?.array.swapAt(indexI, indexJ)
        }
    }
}
