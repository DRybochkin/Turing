//
//  OptionalProtocol.swift
//  TuringUserDefaultsService
//
//  Created by Dmitry Rybochkin on 22/04/2019.
//

protocol OptionalProtocol {

    // MARK: - Properties

    var isNil: Bool { get }
}

extension Optional: OptionalProtocol {

    // MARK: - Properties

    var isNil: Bool {
        switch self {
        case .none:
            return true
        case .some:
            return false
        }
    }
}
