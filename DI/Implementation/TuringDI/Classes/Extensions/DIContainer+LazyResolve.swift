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

    public func lazyResolve<T, P: DILazyProtocol, P1>(_ protocolType: T.Type, _ parameter1: P1?) -> P? {
        let lazy: DILazy<T> = lazyResolve(T.self, parameter1)
        return lazy as? P
    }

    public func lazyResolve<T, P: DILazyProtocol, P1, P2>(_ protocolType: T.Type,
                                                          _ parameter1: P1?,
                                                          _ parameter2: P2?) -> P? {
        let lazy: DILazy<T> = lazyResolve(T.self, parameter1, parameter2)
        return lazy as? P
    }

    public func lazyResolve<T, P: DILazyProtocol, P1, P2, P3>(_ protocolType: T.Type,
                                                              _ parameter1: P1?,
                                                              _ parameter2: P2?,
                                                              _ parameter3: P3?) -> P? {
        let lazy: DILazy<T> = lazyResolve(T.self, parameter1, parameter2, parameter3)
        return lazy as? P
    }

    public func lazyResolveSingletone<T, P: DILazyProtocol>(_ protocolType: T.Type) -> P? {
        let lazy: DILazy<T> = lazyResolveSingletone(T.self)
        return lazy as? P
    }

    public func lazyResolveSingletone<T, P: DILazyProtocol, P1>(_ protocolType: T.Type, _ parameter1: P1?) -> P? {
        let lazy: DILazy<T> = lazyResolveSingletone(T.self, parameter1)
        return lazy as? P
    }

    public func lazyResolveSingletone<T, P: DILazyProtocol, P1, P2>(_ protocolType: T.Type,
                                                                    _ parameter1: P1?,
                                                                    _ parameter2: P2?) -> P? {
        let lazy: DILazy<T> = lazyResolveSingletone(T.self, parameter1, parameter2)
        return lazy as? P
    }

    public func lazyResolveSingletone<T, P: DILazyProtocol, P1, P2, P3>(_ protocolType: T.Type,
                                                                        _ parameter1: P1?,
                                                                        _ parameter2: P2?,
                                                                        _ parameter3: P3?) -> P? {
        let lazy: DILazy<T> = lazyResolveSingletone(T.self, parameter1, parameter2, parameter3)
        return lazy as? P
    }
}
