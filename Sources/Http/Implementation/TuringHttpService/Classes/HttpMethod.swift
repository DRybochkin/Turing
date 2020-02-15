//
//  HttpMethod.swift
//  TuringHttpService
//
//  Created by Dmitry Rybochkin on 10/06/2019.
//  Copyright © 2019 Dmitry Rybochkin. All rights reserved.
//

import TuringHttpServiceInterface

public enum HttpMethod: String, HttpMethodProtocol {

    // MARK: - Cases

    case options = "OPTIONS"
    case get     = "GET"
    case head    = "HEAD"
    case post    = "POST"
    case put     = "PUT"
    case patch   = "PATCH"
    case delete  = "DELETE"
    case trace   = "TRACE"
    case connect = "CONNECT"
}
