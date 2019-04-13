//
//  DI.swift
//  TuringDI
//
//  Created by Dmitry Rybochkin on 09.04.2019.
//  Copyright © 2019 Turing. All rights reserved.
//

import Foundation
import TuringDIInterface

public class TuringDI: TuringDIProtocol {

    // MARK: - Properties

    // TODO: - добавить потокобезопасный словарь
    var items: [String: TuringDI.Item] = [:]
    var depth: Int = 0
    public var maxRecursiveDepth: Int = 10
    public static var `default`: TuringDIProtocol = TuringDI()

    // MARK: - Constructos

    public init() {
    }

    // MARK: - Functions

    func hashKey(types: [Any.Type]) -> String {
        return types.compactMap({ "\($0)" }).joined(separator: "-")
    }
}
