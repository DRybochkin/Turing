//
//  UserDefaultsService+Error.swift
//  TuringUserDefaultsService
//
//  Created by Dmitry Rybochkin on 12/06/2019.
//

import TuringError
import TuringErrorInterface

extension UserDefaultsService {

    public enum ServiceError: Int, ErrorConvertible, ErrorCodeProtocol {

        // MARK: - Cases

        case save
        case decode
        case encode
        case notSupportedType
        case keyNotFound
        case valueIsNil

        // MARK: - Properties

        public static var domain: String = "UserDefaultsService"
        public static var domainCode: String = "UDS"
    }
}
