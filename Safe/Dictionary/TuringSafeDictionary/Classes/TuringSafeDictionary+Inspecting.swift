//
//  TuringSafeDictionary+Inspecting.swift
//  TuringSafe
//
//  Created by Dmitry Rybochkin on 15/04/2019.
//

import Foundation

extension TuringSafeDictionary {

    // MARK: - Properties

    public var isEmpty: Bool {
        return dispatchQueue.sync(flags: .barrier) {
            dictionary.isEmpty
        }
    }

    public var count: Int {
        return dispatchQueue.sync(flags: .barrier) {
            dictionary.count
        }
    }

    public var capacity: Int {
        return dispatchQueue.sync(flags: .barrier) {
            dictionary.capacity
        }
    }
}
