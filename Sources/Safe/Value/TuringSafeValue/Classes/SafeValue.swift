//
//  SafeValue.swift
//  TuringSafeValue
//
//  Created by Dmitry Rybochkin on 15/04/2019.
//  Copyright (c) 2019 Dmitry Rybochkin. All rights reserved.
//

import Foundation

public final class SafeValue<Value>: SafeValueProtocol {

    // MARK: - Properties

    var safeValue: Value
    let dispatchQueue: DispatchQueue

    public var value: Value {
        get {
            return dispatchQueue.sync {
                safeValue
            }
        }
        set {
            dispatchQueue.async(flags: .barrier) { [weak self] in
                guard let self = self else {
                    return
                }
                self.safeValue = newValue
            }
        }
    }

    // MARK: - Initialization

    public init(_ value: Value, isConcurrent: Bool = true) {
        let queueLabel = "SafeValue<\(Value.self)>.DispatchQueue.\(UUID().uuidString)"
        if isConcurrent {
            dispatchQueue = DispatchQueue(label: queueLabel, attributes: .concurrent)
        } else {
            dispatchQueue = DispatchQueue(label: queueLabel)
        }
        safeValue = value
        self.value = value
    }

    // MARK: - Functions

    public func async(_ closure: @escaping (inout Value) -> Void) {
        dispatchQueue.async(flags: .barrier) { [weak self] in
            guard let self = self else {
                return
            }
            closure(&self.safeValue)
        }
    }

    @discardableResult
    public func sync<T>(_ closure: @escaping (inout Value) -> T) -> T {
        return dispatchQueue.sync {
            closure(&safeValue)
        }
    }
}
