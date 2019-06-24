//
//  UnderlyingError.swift
//  TuringError
//
//  Created by Dmitry Rybochkin on 10/04/2019.
//  Copyright © 2019 Dmitry Rybochkin. All rights reserved.
//

import Foundation
import TuringErrorInterface

public final class UnderlyingError: UnderlyingErrorProtocol {

    // MARK: - Properties

    public let domain: String
    public let domainCode: String
    public let code: ErrorCodeProtocol
    private(set) public var underlying: UnderlyingErrorProtocol?
    private(set) public var userInfo: [AnyHashable: Any]?

    // MARK: - Initialization

    public init(domain: String, domainCode: String, code: ErrorCodeProtocol) {
        self.domain = domain
        self.domainCode = domainCode
        self.code = code
    }

    public init(error: NSError) {
        self.code = ErrorCode(code: error.code, name: "NSError")
        self.userInfo = error.userInfo
        self.domain = error.domain
        self.domainCode = "NSE"
    }

    // MARK: - Functions

    public func underlying(_ error: Error) -> UnderlyingError {
        switch error {
        case let error as UnderlyingErrorProtocol:
            underlying = error
        default:
            underlying = UnderlyingError(error: error as NSError)
        }
        return self
    }

    public func info(_ info: [AnyHashable: Any]) -> UnderlyingError {
        userInfo = info
        return self
    }
}

private extension UnderlyingError {

    // MARK: - Types

    struct ErrorCode: ErrorCodeProtocol {
        let code: Int
        let name: String
    }
}
