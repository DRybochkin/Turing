//
//  TuringSafeDictionary+Comparable.swift
//  TuringSafe
//
//  Created by Dmitry Rybochkin on 15/04/2019.
//

import Foundation

extension TuringSafeDictionary: Equatable where Key: Equatable, Value: Equatable {

    // MARK: - Functions

    public static func ==(lhs: TuringSafeDictionary<Key, Value>, rhs: TuringSafeDictionary<Key, Value>) -> Bool {
        let lhsElements: DictionaryType = lhs.compactMapValues({ $0 })
        let rhsElements: DictionaryType = rhs.compactMapValues({ $0 })
        return lhsElements == rhsElements
    }

    public static func !=(lhs: TuringSafeDictionary<Key, Value>, rhs: TuringSafeDictionary<Key, Value>) -> Bool {
        let lhsElements: DictionaryType = lhs.compactMapValues({ $0 })
        let rhsElements: DictionaryType = rhs.compactMapValues({ $0 })
        return lhsElements != rhsElements
    }

    public static func ==(lhs: TuringSafeDictionary<Key, Value>, rhs: DictionaryType) -> Bool {
        let lhsElements: DictionaryType = lhs.compactMapValues({ $0 })
        return lhsElements == rhs
    }

    public static func !=(lhs: TuringSafeDictionary<Key, Value>, rhs: DictionaryType) -> Bool {
        let lhsElements: DictionaryType = lhs.compactMapValues({ $0 })
        return lhsElements != rhs
    }

    public static func ==(lhs: DictionaryType, rhs: TuringSafeDictionary<Key, Value>) -> Bool {
        let rhsElements: DictionaryType = rhs.compactMapValues({ $0 })
        return lhs == rhsElements
    }

    public static func !=(lhs: DictionaryType, rhs: TuringSafeDictionary<Key, Value>) -> Bool {
        let rhsElements: DictionaryType = rhs.compactMapValues({ $0 })
        return lhs != rhsElements
    }
}
