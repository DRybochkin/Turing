//
//  TestError.swift
//  TuringErrorImplementation_Tests
//
//  Created by Dmitry Rybochkin on 11/04/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation
import TuringErrorImplementation

enum TestErrorCode: Int, TuringEnumErrorCodeProtocol {

    // MARK: - Cases

    case error0
    case error1
    case error2
    case error404 = 404

    var domain: String {
        return "TestError"
    }
    var domainCode: String {
        return "TE"
    }
}
