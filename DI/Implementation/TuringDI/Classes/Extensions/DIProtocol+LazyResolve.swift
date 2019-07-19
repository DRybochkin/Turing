//
//  DIProtocol+LazyResolve.swift
//  TuringDI
//
//  Created by Dmitry Rybochkin on 19/07/2019.
//

import TuringDIInterface

extension DIProtocol {

    // MARK: - Functions

    public func lazyResolve<T>(_ protocolType: T.Type) -> DILazy<T> {
        return DILazy<T>(T.self, di: self, factory: { $0?.resolve() })
    }

    public func lazyResolve<T, P1>(_ protocolType: T.Type, parameter1: P1) -> DILazy<T> {
        return DILazy<T>(T.self, di: self, factory: { $0?.resolve(parameter: parameter1) })
    }

    public func lazyResolve<T, P1, P2>(_ protocolType: T.Type,
                                       parameter1: P1,
                                       parameter2: P2) -> DILazy<T> {
        return DILazy<T>(T.self, di: self, factory: { $0?.resolveSingletone(parameter1: parameter1,
                                                                            parameter2: parameter2) })
    }

    public func lazyResolve<T, P1, P2, P3>(_ protocolType: T.Type,
                                           parameter1: P1,
                                           parameter2: P2,
                                           parameter3: P3) -> DILazy<T> {
        return DILazy<T>(T.self, di: self, factory: { $0?.resolveSingletone(parameter1: parameter1,
                                                                            parameter2: parameter2,
                                                                            parameter3: parameter3) })
    }

    public func lazyResolveSingletone<T>(_ protocolType: T.Type) -> DILazy<T> {
        return DILazy<T>(T.self, di: self, factory: { $0?.resolveSingletone() })
    }

    public func lazyResolveSingletone<T, P1>(_ protocolType: T.Type, parameter1: P1) -> DILazy<T> {
        return DILazy<T>(T.self, di: self, factory: { $0?.resolveSingletone(parameter: parameter1) })
    }

    public func lazyResolveSingletone<T, P1, P2>(_ protocolType: T.Type,
                                                 parameter1: P1,
                                                 parameter2: P2) -> DILazy<T> {
        return DILazy<T>(T.self, di: self, factory: { $0?.resolveSingletone(parameter1: parameter1,
                                                                            parameter2: parameter2) })
    }

    public func lazyResolveSingletone<T, P1, P2, P3>(_ protocolType: T.Type,
                                                     parameter1: P1,
                                                     parameter2: P2,
                                                     parameter3: P3) -> DILazy<T> {
        return DILazy<T>(T.self, di: self, factory: { $0?.resolveSingletone(parameter1: parameter1,
                                                                            parameter2: parameter2,
                                                                            parameter3: parameter3) })
    }
}
