//
//  TuringSafeArray+Combining.swift
//  TuringSafe
//
//  Created by Dmitry Rybochkin on 15/04/2019.
//

import Foundation

extension TuringSafeArray {

    // MARK: - Functions

    public func append<S>(contentsOf newElements: S) where S: Sequence, Value == S.Element {
        dispatchQueue.async(flags: .barrier) { [weak self] in
            self?.array.append(contentsOf: newElements)
        }
    }

    public static func +<Other>(lhs: Other, rhs: TuringSafeArray<Value>) -> Array<Value> where Other: Sequence, Value == Other.Element {
        return lhs + rhs.map({ $0 })
    }

    public static func +<Other>(lhs: TuringSafeArray<Value>, rhs: Other) -> TuringSafeArray<Value> where Other: Sequence, Value == Other.Element {
        let result: TuringSafeArray<Value> = []
        result.append(contentsOf: lhs)
        result.append(contentsOf: rhs)
        return result
    }

    public static func +=(lhs: inout Array<Value>, rhs: TuringSafeArray<Value>) {
        lhs.append(contentsOf: rhs.map({ $0 }))
    }

    public static func +=(lhs: inout TuringSafeArray<Value>, rhs: Array<Value>) {
        rhs.forEach({ lhs.append($0) })
    }
}
