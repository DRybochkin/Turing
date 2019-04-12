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

    public init(code: ErrorCode, underlying: TuringErrorProtocol? = nil, userInfo: Info? = nil) {
        self.code = code
        self.underlying = underlying
        self.userInfo = userInfo
    }

    public init(code: ErrorCode, underlying: NSError, userInfo: Info? = nil) {
        self.init(code: code,
                  underlying: NSErrorWrapper(error: underlying),
                  userInfo: userInfo)
    }
}
