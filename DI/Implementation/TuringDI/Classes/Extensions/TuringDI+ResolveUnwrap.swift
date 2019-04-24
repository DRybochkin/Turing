//
//  TuringDI+ResolveUnwrap.swift
//  TuringDI
//
//  Created by Dmitry Rybochkin on 24/04/2019.
//

import Foundation
import TuringDIInterface

extension TuringDIResolveProtocol {

    // MARK: - Abstract Functions

    public func resolveUnwrap<T, P1, P2, P3>(_ protocolType: T.Type,
                                             parameter1: P1,
                                             parameter2: P2,
                                             parameter3: P3) -> T! {
        guard let result = resolve(protocolType,
                                   parameter1: parameter1,
                                   parameter2: parameter2,
                                   parameter3: parameter3) else {
            return nil
        }
        return result
    }

    public func resolveUnwrap<T, P1, P2>(_ protocolType: T.Type, parameter1: P1, parameter2: P2) -> T! {
        guard let result = resolve(protocolType, parameter1: parameter1, parameter2: parameter2) else {
            return nil
        }
        return result
    }

    public func resolveUnwrap<T, P>(_ protocolType: T.Type, parameter: P) -> T! {
        guard let result = resolve(protocolType, parameter: parameter) else {
            return nil
        }
        return result
    }

    public func resolveUnwrap<T>(_ protocolType: T.Type) -> T! {
        guard let result = resolve(protocolType) else {
            return nil
        }
        return result
    }

    public func resolveUnwrap<T, P1, P2, P3>(parameter1: P1, parameter2: P2, parameter3: P3) -> T! {
        guard let result: T = resolve(parameter1: parameter1, parameter2: parameter2, parameter3: parameter3) else {
            return nil
        }
        return result
    }

    public func resolveUnwrap<T, P1, P2>(parameter1: P1, parameter2: P2) -> T! {
        guard let result: T = resolve(parameter1: parameter1, parameter2: parameter2) else {
            return nil
        }
        return result
    }

    public func resolveUnwrap<T, P>(parameter: P) -> T! {
        guard let result: T = resolve(parameter: parameter) else {
            return nil
        }
        return result
    }

    public func resolveUnwrap<T>() -> T! {
        guard let result: T = resolve() else {
            return nil
        }
        return result
    }

    public func resolveSingletoneUnwrap<T, P1, P2, P3>(_ protocolType: T.Type,
                                                       parameter1: P1,
                                                       parameter2: P2,
                                                       parameter3: P3) -> T! {
        guard let result = resolveSingletone(protocolType,
                                             parameter1: parameter1,
                                             parameter2: parameter2,
                                             parameter3: parameter3) else {
            return nil
        }
        return result
    }

    public func resolveSingletoneUnwrap<T, P1, P2>(_ protocolType: T.Type, parameter1: P1, parameter2: P2) -> T! {
        guard let result = resolveSingletone(protocolType, parameter1: parameter1, parameter2: parameter2) else {
            return nil
        }
        return result
    }

    public func resolveSingletoneUnwrap<T, P>(_ protocolType: T.Type, parameter: P) -> T! {
        guard let result = resolveSingletone(protocolType, parameter: parameter) else {
            return nil
        }
        return result
    }

    public func resolveSingletoneUnwrap<T>(_ protocolType: T.Type) -> T! {
        guard let result = resolveSingletone(protocolType) else {
            return nil
        }
        return result
    }

    public func resolveSingletoneUnwrap<T, P1, P2, P3>(parameter1: P1, parameter2: P2, parameter3: P3) -> T! {
        guard let result: T = resolveSingletone(parameter1: parameter1,
                                                parameter2: parameter2,
                                                parameter3: parameter3) else {
            return nil
        }
        return result
    }

    public func resolveSingletoneUnwrap<T, P1, P2>(parameter1: P1, parameter2: P2) -> T! {
        guard let result: T = resolveSingletone(parameter1: parameter1, parameter2: parameter2) else {
            return nil
        }
        return result
    }

    public func resolveSingletoneUnwrap<T, P>(parameter: P) -> T! {
        guard let result: T = resolveSingletone(parameter: parameter) else {
            return nil
        }
        return result
    }

    public func resolveSingletoneUnwrap<T>() -> T! {
        guard let result: T = resolveSingletone() else {
            return nil
        }
        return result
    }
}
