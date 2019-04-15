//
//  TuringSafeArray+Inspecting.swift
//  TuringSafe
//
//  Created by Dmitry Rybochkin on 15/04/2019.
//

import Foundation

extension TuringSafeArray {

    // MARK: - Properties

    public var isEmpty: Bool {
        var result = true
        dispatchQueue.sync(flags: .barrier) {
            result = array.isEmpty
        }
        return result
    }

    public var count: Int {
        var result = 0
        dispatchQueue.sync(flags: .barrier) {
            result = array.count
        }
        return result
    }

    public var capacity: Int {
        var result = 0
        dispatchQueue.sync(flags: .barrier) {
            result = array.capacity
        }
        return result
    }
}
