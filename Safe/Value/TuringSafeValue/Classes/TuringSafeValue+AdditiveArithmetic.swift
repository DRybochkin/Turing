//
//  TuringSafeValue+AdditiveArithmetic.swift
//  TuringSafeValue
//
//  Created by Dmitry Rybochkin on 17/04/2019.
//

import Foundation

extension TuringSafeValue: AdditiveArithmetic where Value: AdditiveArithmetic {

    // MARK: - Properties

    public static var zero: TuringSafeValue {
        return .init(Value.zero)
    }

    // MARK: - Functions

    public static func -= (lhs: inout TuringSafeValue<Value>, rhs: TuringSafeValue<Value>) {
        //swiftlint:disable:next shorthand_operator
        lhs.value = lhs.value - rhs.value
    }

    public static func - (lhs: TuringSafeValue<Value>, rhs: TuringSafeValue<Value>) -> Self {
        return .init(lhs.value - rhs.value)
    }

    public static func += (lhs: inout TuringSafeValue<Value>, rhs: TuringSafeValue<Value>) {
        //swiftlint:disable:next shorthand_operator
        lhs.value = lhs.value + rhs.value
    }

    public static func + (lhs: TuringSafeValue<Value>, rhs: TuringSafeValue<Value>) -> Self {
        return .init(lhs.value + rhs.value)
    }

    public static func += (lhs: TuringSafeValue<Value>, rhs: Value) {
        //swiftlint:disable:next shorthand_operator
        lhs.value = lhs.value + rhs
    }

    public static func -= (lhs: TuringSafeValue<Value>, rhs: Value) {
        //swiftlint:disable:next shorthand_operator
        lhs.value = lhs.value - rhs
    }

    public static func += (lhs: inout Value, rhs: TuringSafeValue<Value>) {
        lhs += rhs.value
    }

    public static func -= (lhs: inout Value, rhs: TuringSafeValue<Value>) {
        lhs -= rhs.value
    }
}
