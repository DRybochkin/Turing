//
//  TuringSafeValue+AdditiveArithmetic.swift
//  TuringSafeValue
//
//  Created by Dmitry Rybochkin on 17/04/2019.
//

import Foundation

extension TuringSafeValue: AdditiveArithmetic where T: AdditiveArithmetic {

    // MARK: - Properties

    public static var zero: TuringSafeValue {
        return .init(T.zero)
    }

    // MARK: - Functions

    public static func -= (lhs: inout TuringSafeValue<T>, rhs: TuringSafeValue<T>) {
        lhs.value = lhs.value - rhs.value
    }

    public static func - (lhs: TuringSafeValue<T>, rhs: TuringSafeValue<T>) -> Self {
        return .init(lhs.value - rhs.value)
    }

    public static func += (lhs: inout TuringSafeValue<T>, rhs: TuringSafeValue<T>) {
        lhs.value = lhs.value + rhs.value
    }

    public static func + (lhs: TuringSafeValue<T>, rhs: TuringSafeValue<T>) -> Self {
        return .init(lhs.value + rhs.value)
    }

    public static func +=(lhs: TuringSafeValue<T>, rhs: T)  {
        lhs.value = lhs.value + rhs
    }

    public static func -=(lhs: TuringSafeValue<T>, rhs: T)  {
        lhs.value = lhs.value - rhs
    }

    public static func +=(lhs: inout T, rhs: TuringSafeValue<T>)  {
        lhs += rhs.value
    }

    public static func -=(lhs: inout T, rhs: TuringSafeValue<T>) {
        lhs -= rhs.value
    }
}
