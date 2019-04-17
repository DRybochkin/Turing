//
//  TuringSafeValue+Equatable.swift
//  TuringSafeValue
//
//  Created by Dmitry Rybochkin on 17/04/2019.
//

import Foundation

extension TuringSafeValue: Equatable where T: Equatable {

    // MARK: - Functions

    public static func == (lhs: TuringSafeValue<T>, rhs: TuringSafeValue<T>) -> Bool {
        return lhs.value == rhs.value
    }
}
