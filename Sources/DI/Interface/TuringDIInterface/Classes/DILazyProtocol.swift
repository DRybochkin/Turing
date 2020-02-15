//
//  DILazyProtocol.swift
//  TuringDIInterface
//
//  Created by Dmitry Rybochkin on 19/07/2019.
//

public protocol DILazyProtocol {

    // MARK: - Types

    associatedtype LazyType
    typealias Factory = (DIResolveProtocol?) -> LazyType?

    // MARK: - Properties

    var instance: LazyType? { get }

    // MARK: - Functions

    func instantiate() -> LazyType?
}
