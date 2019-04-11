//
//  TuringError.swift
//  TuringError
//
//  Created by Dmitry Rybochkin on 10/04/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation
import TuringErrorInterface

struct TuringError<ErrorCode: TuringEnumErrorCodeProtocol>: TuringErrorProtocol {

    // MARK: - Properties

    let domainCode: String = "SE"
    let code: TuringErrorCodeProtocol
    var underlying: TuringErrorProtocol?
    let userInfo: Info?

    // MARK: - Constructors

    init(code: ErrorCode, underlying: TuringErrorProtocol? = nil, userInfo: Info? = nil) {
        self.code = code
        self.underlying = underlying
        self.userInfo = userInfo
    }
}
