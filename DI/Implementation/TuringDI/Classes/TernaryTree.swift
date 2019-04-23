//
//  TernaryTree.swift
//  TuringDI
//
//  Created by Dmitry Rybochkin on 23/04/2019.
//

import Foundation

indirect enum TernaryTree {

    // MARK: - Types

    typealias Value = Any.Type

    // MARK: - Cases

    case node(Value, TernaryTree, TernaryTree, TernaryTree)
    case empty(Value)

    // MARK: - Constructors

    private init(value: Value, depth: Int, values: [Value]) {
        guard depth + 1 < values.count else {
            self = .empty(value)
            return
        }
        self = .node(value,
                     .init(value: values[depth + 1], depth: depth + 1, values: values),
                     .init(value: Any.self, depth: depth + 1, values: values),
                     .init(value: Any?.self, depth: depth + 1, values: values))
    }

    init(values: [Value]) {
        self = .node(values[0],
                     .init(value: values[1], depth: 1, values: values),
                     .init(value: Any.self, depth: 1, values: values),
                     .init(value: Any?.self, depth: 1, values: values))
    }

    // MARK: - Functions

    func traversals(values: [Value], process: ([Value]) -> Void) {
        switch self {
        case let .node(value, first, second, third):
            first.traversals(values: values + [value], process: process)
            second.traversals(values: values + [value], process: process)
            third.traversals(values: values + [value], process: process)
        case let .empty(value):
            process(values + [value])
        }
    }
}
