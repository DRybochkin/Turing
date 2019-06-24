//
//  HttpRequestProtocol.swift
//  TuringHttpServiceInterface
//
//  Created by Dmitry Rybochkin on 10/06/2019.
//  Copyright © 2019 Turing. All rights reserved.
//

public protocol HttpRequestProtocol {

    // MARK: - Properties

    var endPoint: HttpEndPointProtocol { get }
    var path: String? { get }
    var parameters: [String: Any]? { get }
    var method: HttpMethodProtocol { get }
    var url: URL? { get }
    var validCodes: [Int] { get }
    var headers: [String: String]? { get }
    var contentType: String { get }
}
