//
//  TuringDIError.swift
//  TuringDI
//
//  Created by Dmitry Rybochkin on 12/04/2019.
//

import Foundation
import TuringError

extension TuringDI {

    public enum DIError: Int, TuringEnumErrorCodeProtocol {

        // MARK: - Cases

        case factoryForProtocolNotFound
        case factoryReturnsNil
        case unknownScope

        // MARK: - Properties

        public var domain: String {
            return "TutingDI"
        }
        
        public var domainCode: String {
            return "TDI"
        }

        static let key = "key"
        static let scope = "scope"
    }
}
