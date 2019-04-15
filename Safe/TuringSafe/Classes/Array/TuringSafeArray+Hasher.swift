//
//  TuringSafeArray+Hasher.swift
//  TuringSafe
//
//  Created by Dmitry Rybochkin on 15/04/2019.
//

import Foundation

extension TuringSafeArray where Value: Hashable { }

extension TuringSafeArray: Hashable where Value : Hashable {

    // MARK: - Functions

    public func hash(into hasher: inout Hasher) {
        dispatchQueue.sync(flags: .barrier) {
            self.array.forEach({ $0.hash(into: &hasher) })
        }
    }
}
