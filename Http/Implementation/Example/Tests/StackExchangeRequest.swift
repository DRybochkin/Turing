//
//  StackExchangeRequest.swift
//  TuringHttpService_Tests
//
//  Created by Dmitry Rybochkin on 11/06/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import TuringHttpService
import TuringHttpServiceInterface

struct StackExchangeRequest: HttpRequestProtocol {

    // MARK: - Properties

    var endPoint: HttpEndPointProtocol = EndPoint()
    var path: String? = "questions"
    var parameters: [String: Any]? = ["order": "desc", "sort": "votes", "site": "stackoverflow"]

    // MARK: - Types

    private struct EndPoint: HttpEndPointProtocol {

        // MARK: - Properties

        var urlString: String = "https://api.stackexchange.com/2.2/"
    }
}
