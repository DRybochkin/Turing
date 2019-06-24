//
//  UnderlyingErrorProtocol+Abstract.swift
//  TuringError
//
//  Created by Dmitry Rybochkin on 10/04/2019.
//  Copyright © 2019 Dmitry Rybochkin. All rights reserved.
//

import TuringErrorInterface

extension UnderlyingErrorProtocol {

    // MARK: - Properties

    public var description: String {
        guard let underlying = underlying else {
            return "\(domain).\(code.name)"
        }
        return "\(domain).\(code.name)-\(underlying.description)"
    }

    public var debugDescription: String {
        var userInfoString: String = ""
        if let userInfo = userInfo {
            userInfoString = "(\(userInfo))"
        }
        guard let underlying = underlying else {
            return "\(domain).\(code.name)\(userInfoString)"
        }
        return "\(domain).\(code.name)\(userInfoString)-\(underlying.debugDescription)"
    }

    public var path: String {
        guard let underlying = underlying else {
            return "\(domainCode)\(code.code)"
        }
        return "\(domainCode)\(code.code)-\(underlying.path)"
    }

    public var underlyingUserInfo: [AnyHashable: Any]? {
        var result: [AnyHashable: Any] = [:]
        if let underlying = underlying, let underlyingUserInfo = underlying.underlyingUserInfo {
            result = underlyingUserInfo
        }
        if let userInfo = userInfo {
            let key = "\(domainCode)\(code.code)"
            result[key] = userInfo
        }
        return result.isEmpty ? nil : result
    }
}
