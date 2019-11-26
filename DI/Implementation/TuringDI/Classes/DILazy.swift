//
//  DILazy.swift
//  TuringDI
//
//  Created by Dmitry Rybochkin on 19/07/2019.
//

import TuringDIInterface

final public class DILazy<P>: DILazyProtocol {

    // MARK: - Properties

    private let factory: Factory
    private weak var diContainer: DIProtocol?
    public lazy var instance: P? = factory(diContainer)

    // MARK: - Constructions

    public init(_ protocolType: P.Type, di diContainer: DIProtocol, factory: @escaping Factory) {
        self.factory = factory
        self.diContainer = diContainer
    }

    // MARK: - Functions

    public func instantiate() -> P? {
        return factory(diContainer)
    }
}
