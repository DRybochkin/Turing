//
//  TuringError.swift
//  TuringError
//
//  Created by Dmitry Rybochkin on 10/04/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation
import TuringErrorInterface

public struct TuringError<ErrorCode: TuringEnumErrorCodeProtocol>: TuringErrorProtocol {

    // MARK: - Properties

    public let domainCode: String = "SE"
    public let code: TuringErrorCodeProtocol
    public let underlying: TuringErrorProtocol?
    public let userInfo: Info?

    // MARK: - Constructors

    public init(code: ErrorCode, underlying: TuringErrorProtocol, userInfo: Info? = nil) {
        self.code = code
        self.underlying = underlying
        self.userInfo = userInfo
    }

    public init(code: ErrorCode, underlying: TuringErrorProtocol? = nil, userInfo: Info? = nil) {
        self.code = code
        self.underlying = underlying
        self.userInfo = userInfo
    }

    public init(code: ErrorCode, underlying: Error, userInfo: Info? = nil) {
        switch underlying {
        case let error as TuringErrorProtocol:
            self.init(code: code, underlying: error, userInfo: userInfo)
        case let error as NSError:
            self.init(code: code, underlying: NSErrorWrapper(error: error), userInfo: userInfo)
        default:
            self.init(code: code, underlying: nil, userInfo: userInfo)
        }
    }
}
