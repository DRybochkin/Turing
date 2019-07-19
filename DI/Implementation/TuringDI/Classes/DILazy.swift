//
//  DILazy.swift
//  TuringDI
//
//  Created by Dmitry Rybochkin on 19/07/2019.
//

import TuringDIInterface

final public class DILazy<P>: DILazyProtocol {

    // MARK: - Properties

    private let factory: Facrory
    private weak var diContainer: DIProtocol?
    public lazy var instance: P? = factory(diContainer)

    // MARK: - Constructions

    public init(_ protocolType: P.Type, di diContainer: DIProtocol, factory: @escaping Facrory) {
        self.factory = factory
        self.diContainer = diContainer
    }
}
