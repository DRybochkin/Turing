//
//  SafeValue+AdditiveArithmetic.swift
//  TuringSafeValue
//
//  Created by Dmitry Rybochkin on 17/04/2019.
//  Copyright (c) 2019 Dmitry Rybochkin. All rights reserved.
//

import Foundation

extension SafeValue: AdditiveArithmetic where Value: AdditiveArithmetic {

    // MARK: - Properties

    public static var zero: SafeValue {
        return .init(Value.zero)
    }

    // MARK: - Functions

    public static func -= (lhs: inout SafeValue<Value>, rhs: SafeValue<Value>) {
        //swiftlint:disable:next shorthand_operator
        lhs.value = lhs.value - rhs.value
    }

    public static func - (lhs: SafeValue<Value>, rhs: SafeValue<Value>) -> Self {
        return .init(lhs.value - rhs.value)
    }

    public static func += (lhs: inout SafeValue<Value>, rhs: SafeValue<Value>) {
        //swiftlint:disable:next shorthand_operator
        lhs.value = lhs.value + rhs.value
    }

    public static func + (lhs: SafeValue<Value>, rhs: SafeValue<Value>) -> Self {
        return .init(lhs.value + rhs.value)
    }

    public static func += (lhs: SafeValue<Value>, rhs: Value) {
        //swiftlint:disable:next shorthand_operator
        lhs.value = lhs.value + rhs
    }

    public static func -= (lhs: SafeValue<Value>, rhs: Value) {
        //swiftlint:disable:next shorthand_operator
        lhs.value = lhs.value - rhs
    }

    public static func += (lhs: inout Value, rhs: SafeValue<Value>) {
        lhs += rhs.value
    }

    public static func -= (lhs: inout Value, rhs: SafeValue<Value>) {
        lhs -= rhs.value
    }
}
