//
//  TuringSafeValue.swift
//  TuringDI
//
//  Created by Dmitry Rybochkin on 15/04/2019.
//

import Foundation

public final class TuringSafeValue<Value>: TuringSafeValueProtocol {

    // MARK: - Properties

    private var safeValue: Value
    private let dispatchQueue: DispatchQueue

    public var value: Value {
        get {
            return dispatchQueue.sync(flags: .barrier) {
                safeValue
            }
        }
        set {
            dispatchQueue.async(flags: .barrier) { [weak self] in
                self?.safeValue = newValue
            }
        }
    }

    // MARK: - Constructors

    public init(_ value: Value, isConcurrent: Bool = true) {
        let queueLabel = "TuringSafeValue<\(Value.self)>.DispatchQueue.\(UUID().uuidString)"
        if isConcurrent {
            dispatchQueue = DispatchQueue(label: queueLabel, attributes: .concurrent)
        } else {
            dispatchQueue = DispatchQueue(label: queueLabel)
        }
        safeValue = value
        self.value = value
    }

    // MARK: - Functions

    public func async(_ cloasure: @escaping (Value) -> Void) {
        dispatchQueue.async(flags: .barrier) { [weak self] in
            guard let self = self else {
                return
            }
            cloasure(self.safeValue)
        }
    }

    @discardableResult
    public func sync<T>(_ cloasure: @escaping (Value) -> T) -> T {
        return dispatchQueue.sync(flags: .barrier) {
            cloasure(safeValue)
        }
    }
}
