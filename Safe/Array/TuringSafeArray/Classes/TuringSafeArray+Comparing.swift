//
//  TuringSafeArray+Comparable.swift
//  TuringSafe
//
//  Created by Dmitry Rybochkin on 15/04/2019.
//

import Foundation

extension TuringSafeArray: Equatable where Value: Equatable { }

extension TuringSafeArray where Element: Equatable {

    // MARK: - Functions

    public static func == (lhs: TuringSafeArray<Element>, rhs: TuringSafeArray<Element>) -> Bool {
        let lhsElements: [Element] = lhs.compactMap({ $0 })
        let rhsElements: [Element] = rhs.compactMap({ $0 })
        return lhsElements == rhsElements
    }

    public static func != (lhs: TuringSafeArray<Element>, rhs: TuringSafeArray<Element>) -> Bool {
        let lhsElements: [Element] = lhs.compactMap({ $0 })
        let rhsElements: [Element] = rhs.compactMap({ $0 })
        return lhsElements != rhsElements
    }
}
