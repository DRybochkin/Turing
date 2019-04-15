//
//  TuringSafeArray.swift
//  TuringDI
//
//  Created by Dmitry Rybochkin on 15/04/2019.
//

import Foundation

public final class TuringSafeArray<Value: Any>: Collection, ExpressibleByArrayLiteral {

    // MARK: - Types

    public typealias ArrayType = Array<Value>
    public typealias Indices = ArrayType.Indices
    public typealias Iterator = ArrayType.Iterator
    public typealias SubSequence = ArrayType.SubSequence
    public typealias Index = ArrayType.Index
    public typealias Element = Value

    // MARK: - Properties

    let dispatchQueue: DispatchQueue
    var array: ArrayType = []

    // MARK: - Constructors

    public init(isConcurrent: Bool) {
        let queueLabel = "TuringSafeArray<\(Value.self)>.DispatchQueue.\(UUID().uuidString)"
        dispatchQueue = isConcurrent ? DispatchQueue(label: queueLabel, attributes: .concurrent) : DispatchQueue(label: queueLabel)
    }

    public convenience init() {
        self.init(isConcurrent: true)
    }

    public convenience init<S>(_ elements: S) where S: Sequence, Value == S.Element {
        self.init()
        array = Array<Value>(elements)
    }

    public convenience init(repeating repeatedValue: Value, count: Int) {
        self.init()
        array = Array<Value>(repeating: repeatedValue, count: count)
    }

    public convenience init(arrayLiteral elements: (Value)...) {
        self.init()
        elements.forEach({ array.append($0) })
    }

    // MARK: - Life cycle

    deinit {
        removeAll()
    }
}
