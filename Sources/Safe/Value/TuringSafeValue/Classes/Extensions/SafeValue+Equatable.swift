//
//  SafeValue+Equatable.swift
//  TuringSafeValue
//
//  Created by Dmitry Rybochkin on 17/04/2019.
//  Copyright (c) 2019 Dmitry Rybochkin. All rights reserved.
//

import Foundation

extension SafeValue: Equatable where Value: Equatable {

    // MARK: - Functions

    public static func == (lhs: SafeValue<Value>, rhs: SafeValue<Value>) -> Bool {
        return lhs.value == rhs.value
    }
}
