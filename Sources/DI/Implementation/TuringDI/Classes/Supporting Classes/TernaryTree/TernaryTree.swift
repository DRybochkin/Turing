//
//  TernaryTree.swift
//  TuringDI
//
//  Created by Dmitry Rybochkin on 23/04/2019.
//  Copyright © 2019 Dmitry Rybochkin. All rights reserved.
//

import Foundation

indirect enum TernaryTree: TernaryTreeProtocol {

    // MARK: - Cases

    case node(Value, TernaryTreeProtocol, TernaryTreeProtocol, TernaryTreeProtocol)
    case empty(Value)

    // MARK: - Initialization

    init(value: Value, depth: Int, values: [Value]) {
        guard depth + 1 < values.count else {
            self = .empty(value)
            return
        }
        self = .node(value,
                     TernaryTree(value: values[depth + 1], depth: depth + 1, values: values),
                     TernaryTree(value: Any.self, depth: depth + 1, values: values),
                     TernaryTree(value: Any?.self, depth: depth + 1, values: values))
    }

    init(values: [Value]) {
        self = .node(values[0],
                     TernaryTree(value: values[1], depth: 1, values: values),
                     TernaryTree(value: Any.self, depth: 1, values: values),
                     TernaryTree(value: Any?.self, depth: 1, values: values))
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
