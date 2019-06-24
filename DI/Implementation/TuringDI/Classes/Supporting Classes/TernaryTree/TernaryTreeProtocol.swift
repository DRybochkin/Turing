//
//  TernaryTreeProtocol.swift
//  TuringDI
//
//  Created by Dmitry Rybochkin on 31/05/2019.
//  Copyright © 2019 Dmitry Rybochkin. All rights reserved.
//

import Foundation

protocol TernaryTreeProtocol {

    // MARK: - Types

    typealias Value = Any.Type

    // MARK: - Inialization

    init(values: [Value])
    init(value: Value, depth: Int, values: [Value])

    // MARK: - Functions

    func traversals(values: [Value], process: ([Value]) -> Void)
}
