//
//  TuringSafeValueProtocol.swift
//  TuringSafeValue
//
//  Created by Dmitry Rybochkin on 18/04/2019.
//

import Foundation

public protocol TuringSafeValueProtocol {

    // MARK: - Types

    associatedtype Value

    typealias Cloasure = (Value) -> Void
    typealias CloasureWithReturn = (Value) -> Value

    // MARK: - Properties

    var value: Value { get set }

    // MARK: - Functions

    func async(_ cloasure: @escaping Cloasure)
    @discardableResult
    func sync(_ cloasure: @escaping CloasureWithReturn) -> Value
}
