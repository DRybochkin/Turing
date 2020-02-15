//
//  HttpRequestProtocol+Abstract.swift
//  TuringHttpService
//
//  Created by Dmitry Rybochkin on 10/06/2019.
//  Copyright © 2019 Dmitry Rybochkin. All rights reserved.
//

import Foundation
import TuringHttpServiceInterface

public extension HttpRequestProtocol {

    // MARK: - Properties

    var parameters: [String: Any]? {
        return nil
    }

    var path: String? {
        return nil
    }

    var contentType: String {
        return "application/json"
    }

    var method: HttpMethodProtocol {
        return HttpMethod.get
    }

    var headers: [String: String]? {
        return nil
    }

    var url: URL? {
        guard var fullUrl = URL(string: endPoint.urlString) else {
            return nil
        }
        if let path = path {
            fullUrl.appendPathComponent(path)
        }
        return fullUrl
    }

    var validCodes: [Int] {
        return [Int](200..<300)
    }
}
