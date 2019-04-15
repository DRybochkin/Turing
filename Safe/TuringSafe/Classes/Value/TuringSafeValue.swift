//
//  TuringSafeValue.swift
//  TuringDI
//
//  Created by Dmitry Rybochkin on 15/04/2019.
//

import Foundation

public final class TuringSafeValue<T> {

    // MARK: - Properties

    private var safeValue: T
    private let dispatchQueue: DispatchQueue = DispatchQueue(label: "TuringSafeValue<\(T.self)>.DispatchQueue.\(UUID().uuidString)", attributes: .concurrent)

    public var value: T {
        get {
            var result: T!
            dispatchQueue.sync { result = self.safeValue }
            return result
        }
        set {
            dispatchQueue.async(flags: .barrier) {
                self.safeValue = newValue
            }
        }
    }

    // MARK: - Constructors

    public init(_ value: T) {
        safeValue = value
        self.value = value
    }
}
