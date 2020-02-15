//
//  TestError.swift
//  TuringError_Tests
//
//  Created by Dmitry Rybochkin on 11/04/2019.
//  Copyright © 2019 Dmitry Rybochkin. All rights reserved.
//

import Foundation
import TuringError
import TuringErrorInterface

enum TestError: Int, ErrorCodeProtocol, ErrorConvertible {

    // MARK: - Cases

    case error0
    case error1
    case error2
    case error404 = 404

    // MARK: - Properties

    static var domain: String = "TestError"
    static var domainCode: String = "TE"
}
