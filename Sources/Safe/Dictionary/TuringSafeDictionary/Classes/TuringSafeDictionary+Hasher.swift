//
//  TuringSafeDictionary+Hasher.swift
//  TuringSafe
//
//  Created by Dmitry Rybochkin on 15/04/2019.
//

import Foundation

extension TuringSafeDictionary where Value: Hashable { }

extension TuringSafeDictionary: Hashable where Value: Hashable {

    // MARK: - Functions

    public func hash(into hasher: inout Hasher) {
        dispatchQueue.sync(flags: .barrier) {
            hasher.combine("\(DictionaryType.self)")
            dictionary.hash(into: &hasher)
        }
    }
}
