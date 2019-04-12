//
//  DI.swift
//  TuringDI
//
//  Created by Dmitry Rybochkin on 09.04.2019.
//  Copyright © 2019 Turing. All rights reserved.
//

import Foundation
import TuringDIInterface
import TuringError
import TuringErrorInterface

public class TuringDI: TuringDIProtocol {

    // MARK: - Types

    public enum Scope: TuringDIScopeProtocol {
        case new
        case optional
        case singleton
    }

    // MARK: - Properties

    var items: [String: TuringDI.Item] = [:]
    public static var `default`: TuringDIProtocol = TuringDI()

    // MARK: - Functions

    func hashKey(types: [Any.Type]) -> String {
        return types.compactMap({ "\($0)" }).joined(separator: "-")
    }
}
