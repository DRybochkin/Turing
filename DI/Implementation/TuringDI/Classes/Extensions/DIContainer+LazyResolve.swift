//
//  DIContainer+LazyResolve.swift
//  TuringDI
//
//  Created by Dmitry Rybochkin on 19/07/2019.
//

import TuringDIInterface

extension DIContainer {

    // MARK: - Functions

    public func lazyResolve<T, P: DILazyProtocol>(_ protocolType: T.Type) -> P? {
        let lazy: DILazy<T> = lazyResolve(T.self)
        return lazy as? P
    }

    public func lazyResolve<T, P: DILazyProtocol, P1>(_ protocolType: T.Type, parameter1: P1) -> P? {
        let lazy: DILazy<T> = lazyResolve(T.self, parameter1: parameter1)
        return lazy as? P
    }

    public func lazyResolve<T, P: DILazyProtocol, P1, P2>(_ protocolType: T.Type,
                                                          parameter1: P1,
                                                          parameter2: P2) -> P? {
        let lazy: DILazy<T> = lazyResolve(T.self,
                                          parameter1: parameter1,
                                          parameter2: parameter2)
        return lazy as? P
    }

    public func lazyResolve<T, P: DILazyProtocol, P1, P2, P3>(_ protocolType: T.Type,
                                                              parameter1: P1,
                                                              parameter2: P2,
                                                              parameter3: P3) -> P? {
        let lazy: DILazy<T> = lazyResolve(T.self,
                                          parameter1: parameter1,
                                          parameter2: parameter2,
                                          parameter3: parameter3)
        return lazy as? P
    }

    public func lazyResolveSingletone<T, P: DILazyProtocol>(_ protocolType: T.Type) -> P? {
        return DILazy<T>(T.self, di: self, factory: { $0?.resolveSingletone() }) as? P
    }

    public func lazyResolveSingletone<T, P: DILazyProtocol, P1>(_ protocolType: T.Type, parameter1: P1) -> P? {
        return DILazy<T>(T.self, di: self, factory: { $0?.resolveSingletone(parameter: parameter1) }) as? P
    }

    public func lazyResolveSingletone<T, P: DILazyProtocol, P1, P2>(_ protocolType: T.Type,
                                                                    parameter1: P1,
                                                                    parameter2: P2) -> P? {
        return DILazy<T>(T.self, di: self, factory: { $0?.resolveSingletone(parameter1: parameter1,
                                                                            parameter2: parameter2) }) as? P
    }

    public func lazyResolveSingletone<T, P: DILazyProtocol, P1, P2, P3>(_ protocolType: T.Type,
                                                                        parameter1: P1,
                                                                        parameter2: P2,
                                                                        parameter3: P3) -> P? {
        return DILazy<T>(T.self, di: self, factory: { $0?.resolveSingletone(parameter1: parameter1,
                                                                            parameter2: parameter2,
                                                                            parameter3: parameter3) }) as? P
    }
}
