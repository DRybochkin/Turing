//
//  SafeValueProtocol.swift
//  TuringSafeValue
//
//  Created by Dmitry Rybochkin on 18/04/2019.
//  Copyright (c) 2019 Dmitry Rybochkin. All rights reserved.
//

import Foundation

public protocol SafeValueProtocol {

    // MARK: - Types

    associatedtype Value

    typealias Closure = (inout Value) -> Void
    typealias ClosureWithReturn = (inout Value) -> Value

    // MARK: - Properties

    var value: Value { get set }

    // MARK: - Functions

    func async(_ closure: @escaping Closure)
    @discardableResult
    func sync(_ closure: @escaping ClosureWithReturn) -> Value
}
