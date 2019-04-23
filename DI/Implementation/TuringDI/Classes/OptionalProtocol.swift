//
//  OptionalProtocol.swift
//  TuringDI
//
//  Created by Dmitry Rybochkin on 22/04/2019.
//

protocol OptionalProtocol {

    // MARK: - Properties

    static var wrappedType: Any.Type { get }
}

extension Optional: OptionalProtocol {

    // MARK: - Absctract properties

    static var wrappedType: Any.Type {
        return Wrapped.self
    }
}
