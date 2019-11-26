//
//  DIResolveProtocol.swift
//  TuringDIInterface
//
//  Created by Dmitry Rybochkin on 12/04/2019.
//  Copyright (c) 2019 Dmitry Rybochkin. All rights reserved.
//

import Foundation

public protocol DIResolveProtocol {

    // MARK: - Functions

    func resolve<T, P1, P2, P3>(_ protocolType: T.Type, _ parameter1: P1?, _ parameter2: P2?, _ parameter3: P3?) -> T?
    func resolve<T, P1, P2>(_ protocolType: T.Type, _ parameter1: P1?, _ parameter2: P2?) -> T?
    func resolve<T, P>(_ protocolType: T.Type, _ parameter: P?) -> T?
    func resolve<T>(_ protocolType: T.Type) -> T?

    func resolve<T, P1, P2, P3>(_ parameter1: P1?, _ parameter2: P2?, _ parameter3: P3?) -> T?
    func resolve<T, P1, P2>(_ parameter1: P1?, _ parameter2: P2?) -> T?
    func resolve<T, P>(_ parameter: P?) -> T?
    func resolve<T>() -> T?

    func resolveSingletone<T, P1, P2, P3>(_ protocolType: T.Type,
                                          _ parameter1: P1?,
                                          _ parameter2: P2?,
                                          _ parameter3: P3?) -> T?
    func resolveSingletone<T, P1, P2>(_ protocolType: T.Type, _ parameter1: P1?, _ parameter2: P2?) -> T?
    func resolveSingletone<T, P>(_ protocolType: T.Type, _ parameter: P?) -> T?
    func resolveSingletone<T>(_ protocolType: T.Type) -> T?

    func resolveSingletone<T, P1, P2, P3>(_ parameter1: P1?, _ parameter2: P2?, _ parameter3: P3?) -> T?
    func resolveSingletone<T, P1, P2>(_ parameter1: P1?, _ parameter2: P2?) -> T?
    func resolveSingletone<T, P>(_ parameter: P?) -> T?
    func resolveSingletone<T>() -> T?

    func lazyResolve<T, P: DILazyProtocol>(_ protocolType: T.Type) -> P?
    func lazyResolve<T, P: DILazyProtocol, P1>(_ protocolType: T.Type, _ parameter1: P1?) -> P?
    func lazyResolve<T, P: DILazyProtocol, P1, P2>(_ protocolType: T.Type, _ parameter1: P1?, _ parameter2: P2?) -> P?
    func lazyResolve<T, P: DILazyProtocol, P1, P2, P3>(_ protocolType: T.Type,
                                                       _ parameter1: P1?,
                                                       _ parameter2: P2?,
                                                       _ parameter3: P3?) -> P?
}
