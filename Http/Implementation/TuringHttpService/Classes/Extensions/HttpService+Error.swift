//
//  HttpService+Error.swift
//  TuringHttpService
//
//  Created by Dmitry Rybochkin on 10/06/2019.
//  Copyright © 2019 Dmitry Rybochkin. All rights reserved.
//

import TuringError
import TuringErrorInterface

extension HttpService {

    public enum ServiceError: Int, ErrorCodeProtocol, ErrorConvertible {

        // MARK: - Cases

        case cancelled
        case decode
        case get
        case invalidUrl
        case invalidMethod

        // MARK: - Properties

        public static var domain: String = "HttpService"
        public static var domainCode: String = "HS"
    }
}
