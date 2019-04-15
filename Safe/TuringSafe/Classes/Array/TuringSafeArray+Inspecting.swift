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
        return dispatchQueue.sync(flags: .barrier) {
            array.isEmpty
        }
    }

    public var count: Int {
        return dispatchQueue.sync(flags: .barrier) {
            array.count
        }
    }

    public var capacity: Int {
        return dispatchQueue.sync(flags: .barrier) {
            array.capacity
        }
    }
}
