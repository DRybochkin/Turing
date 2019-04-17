//
//  TuringSafeValue+Operators.swift
//  TuringSafeValue
//
//  Created by Dmitry Rybochkin on 17/04/2019.
//

import Foundation

// MARK: - Infix operator

infix operator <-
public func <-<T>(lhs: TuringSafeValue<T>, rhs: T) {
    lhs.value = rhs
}

public func <-<T>(lhs: inout T, rhs: TuringSafeValue<T>) {
    lhs = rhs.value
}

public func <-<T>(lhs: TuringSafeValue<T>, rhs: @escaping TuringSafeValue<T>.Cloasure) {
    lhs.cloasure(rhs)
}

// MARK: - Prefix operator

prefix operator §
public prefix func §<T>(value: T) -> TuringSafeValue<T> {
    return TuringSafeValue<T>(value)
}

public prefix func §<T>(safeValue: TuringSafeValue<T>) -> T {
    return safeValue.value
}

