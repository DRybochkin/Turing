//
//  AnyRecursive.swift
//  TuringAnyRecursive
//
//  Created by Dmitry Rybochkin on 11/06/2019.
//  Copyright © 2019 Dmitry Rybochkin. All rights reserved.
//

public enum AnyRecursive: Equatable {

    // MARK: - Cases

    case string(String)
    case number(Float)
    case object([String: AnyRecursive])
    case array([AnyRecursive])
    case bool(Bool)
    case null
}
