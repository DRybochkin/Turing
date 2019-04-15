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
    private let dispatchQueue: DispatchQueue

    public var value: T {
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

    public init(_ value: T, isConcurrent: Bool = true) {
        let queueLabel = "TuringSafeValue<\(T.self)>.DispatchQueue.\(UUID().uuidString)"
        dispatchQueue = isConcurrent ? DispatchQueue(label: queueLabel, attributes: .concurrent) : DispatchQueue(label: queueLabel)
        safeValue = value
        self.value = value
    }
}
