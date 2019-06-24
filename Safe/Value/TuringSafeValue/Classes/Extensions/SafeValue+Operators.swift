//
//  SafeValue+Operators.swift
//  TuringSafeValue
//
//  Created by Dmitry Rybochkin on 17/04/2019.
//  Copyright (c) 2019 Dmitry Rybochkin. All rights reserved.
//

import Foundation

// MARK: - Infix operator

infix operator <-
public func <- <T>(lhs: SafeValue<T>, rhs: T) {
    lhs.value = rhs
}

public func <- <T>(lhs: inout T, rhs: SafeValue<T>) {
    lhs = rhs.value
}

public func <- <T>(lhs: SafeValue<T>, rhs: @escaping SafeValue<T>.Closure) {
    lhs.async(rhs)
}

// MARK: - Prefix operator

prefix operator §
//swiftlint:disable:next identifier_name
public prefix func §<T>(value: T) -> SafeValue<T> {
    return SafeValue<T>(value)
}

//swiftlint:disable:next identifier_name
public prefix func §<T>(safeValue: SafeValue<T>) -> T {
    return safeValue.value
}
