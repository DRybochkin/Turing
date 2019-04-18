//
//  TuringSafeValue+Equatable.swift
//  TuringSafeValue
//
//  Created by Dmitry Rybochkin on 17/04/2019.
//

import Foundation

extension TuringSafeValue: Equatable where Value: Equatable {

    // MARK: - Functions

    public static func == (lhs: TuringSafeValue<Value>, rhs: TuringSafeValue<Value>) -> Bool {
        return lhs.value == rhs.value
    }
}
