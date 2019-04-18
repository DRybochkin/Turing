//
//  NSErrorCodeWrapper.swift
//  TuringErrorImplementation
//
//  Created by Dmitry Rybochkin on 11/04/2019.
//

import Foundation
import TuringErrorInterface

enum NSErrorCodeWrapper: TuringEnumErrorCodeProtocol {

    // MARK: - Cases

    case custom(NSError)

    // MARK: - Properties

    var domain: String {
        switch self {
        case .custom(let error):
            return error.domain
        }
    }

    var domainCode: String {
        return domain
    }

    var rawValue: Int {
        switch self {
        case .custom(let error):
            return error.code
        }
    }

    var path: String {
        return "(\(rawValue))"
    }

    var description: String {
        switch self {
        case .custom(let error):
            return "(\(error.code))"
        }
    }
}
