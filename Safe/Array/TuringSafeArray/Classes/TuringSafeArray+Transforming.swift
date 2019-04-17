//
//  TuringSafeArray+Transforming.swift
//  TuringSafe
//
//  Created by Dmitry Rybochkin on 15/04/2019.
//

import Foundation

extension TuringSafeArray {

    // MARK: - Properties

    var lazy: LazySequence<Array<Element>> {
        return dispatchQueue.sync(flags: .barrier) {
            array.lazy
        }
    }

    // MARK: - Functions

    public func map<T>(_ transform: (Element) throws -> T) rethrows -> [T] {
        return try dispatchQueue.sync(flags: .barrier) {
            try array.map(transform)
        }
    }

    public func compactMap<ElementOfResult>(_ transform: (Element) throws -> ElementOfResult?) rethrows -> [ElementOfResult] {
        return try dispatchQueue.sync(flags: .barrier) {
            try array.compactMap(transform)
        }
    }

    public func compactMap<ElementOfResult>(_ transform: (Element) throws -> ElementOfResult?) rethrows -> TuringSafeArray<ElementOfResult> {
        return try dispatchQueue.sync(flags: .barrier) {
            let result: [ElementOfResult] = try array.compactMap(transform)
            return TuringSafeArray<ElementOfResult>(result)
        }
    }

    public func reduce<Result>(_ initialResult: Result, _ nextPartialResult: (Result, Element) throws -> Result) rethrows -> Result {
        return try dispatchQueue.sync(flags: .barrier) {
            try array.reduce(initialResult, nextPartialResult)
        }
    }

    public func reduce<Result>(into initialResult: Result, _ updateAccumulatingResult: (inout Result, Element) throws -> ()) rethrows -> Result {
        return try dispatchQueue.sync(flags: .barrier) {
            try array.reduce(into: initialResult, updateAccumulatingResult)
        }
    }
}
