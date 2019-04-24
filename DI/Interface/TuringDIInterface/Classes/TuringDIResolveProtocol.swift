//
//  TuringDIResolveProtocol.swift
//  TuringDIInterface
//
//  Created by Dmitry Rybochkin on 12/04/2019.
//

import Foundation

public protocol TuringDIResolveProtocol {

    // MARK: - Functions

    func resolveUnwrap<T, P1, P2, P3>(_ protocolType: T.Type, parameter1: P1, parameter2: P2, parameter3: P3) -> T!
    func resolveUnwrap<T, P1, P2>(_ protocolType: T.Type, parameter1: P1, parameter2: P2) -> T!
    func resolveUnwrap<T, P>(_ protocolType: T.Type, parameter: P) -> T!
    func resolveUnwrap<T>(_ protocolType: T.Type) -> T!

    func resolveUnwrap<T, P1, P2, P3>(parameter1: P1, parameter2: P2, parameter3: P3) -> T!
    func resolveUnwrap<T, P1, P2>(parameter1: P1, parameter2: P2) -> T!
    func resolveUnwrap<T, P>(parameter: P) -> T!
    func resolveUnwrap<T>() -> T!

    func resolveSingletoneUnwrap<T, P1, P2, P3>(_ protocolType: T.Type, parameter1: P1, parameter2: P2, parameter3: P3) -> T!
    func resolveSingletoneUnwrap<T, P1, P2>(_ protocolType: T.Type, parameter1: P1, parameter2: P2) -> T!
    func resolveSingletoneUnwrap<T, P>(_ protocolType: T.Type, parameter: P) -> T!
    func resolveSingletoneUnwrap<T>(_ protocolType: T.Type) -> T!

    func resolveSingletoneUnwrap<T, P1, P2, P3>(parameter1: P1, parameter2: P2, parameter3: P3) -> T!
    func resolveSingletoneUnwrap<T, P1, P2>(parameter1: P1, parameter2: P2) -> T!
    func resolveSingletoneUnwrap<T, P>(parameter: P) -> T!
    func resolveSingletoneUnwrap<T>() -> T!

    func resolve<T, P1, P2, P3>(_ protocolType: T.Type, parameter1: P1, parameter2: P2, parameter3: P3) -> T?
    func resolve<T, P1, P2>(_ protocolType: T.Type, parameter1: P1, parameter2: P2) -> T?
    func resolve<T, P>(_ protocolType: T.Type, parameter: P) -> T?
    func resolve<T>(_ protocolType: T.Type) -> T?

    func resolve<T, P1, P2, P3>(parameter1: P1, parameter2: P2, parameter3: P3) -> T?
    func resolve<T, P1, P2>(parameter1: P1, parameter2: P2) -> T?
    func resolve<T, P>(parameter: P) -> T?
    func resolve<T>() -> T?

    func resolveSingletone<T, P1, P2, P3>(_ protocolType: T.Type, parameter1: P1, parameter2: P2, parameter3: P3) -> T?
    func resolveSingletone<T, P1, P2>(_ protocolType: T.Type, parameter1: P1, parameter2: P2) -> T?
    func resolveSingletone<T, P>(_ protocolType: T.Type, parameter: P) -> T?
    func resolveSingletone<T>(_ protocolType: T.Type) -> T?

    func resolveSingletone<T, P1, P2, P3>(parameter1: P1, parameter2: P2, parameter3: P3) -> T?
    func resolveSingletone<T, P1, P2>(parameter1: P1, parameter2: P2) -> T?
    func resolveSingletone<T, P>(parameter: P) -> T?
    func resolveSingletone<T>() -> T?
}
