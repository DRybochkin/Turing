//
//  DILazyProtocol.swift
//  TuringDIInterface
//
//  Created by Dmitry Rybochkin on 19/07/2019.
//

public protocol DILazyProtocol {

    // MARK: - Types

    associatedtype P
    typealias Facrory = (DIResolveProtocol?) -> P?

    // MARK: - Properties

    var instance: P? { get }
}

