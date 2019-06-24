//
//  HttpService.swift
//  TuringHttpService
//
//  Created by Dmitry Rybochkin on 10/06/2019.
//  Copyright © 2019 Dmitry Rybochkin. All rights reserved.
//

import Alamofire
import Foundation
import TuringHttpServiceInterface

public final class HttpService: HttpServiceProtocol {

    // MARK: - Properties

    private lazy var dispatchQueue = DispatchQueue(label: "ru.Turing.\(HttpService.self).\(UUID().uuidString)",
                                                   qos: .utility,
                                                   attributes: .concurrent,
                                                   autoreleaseFrequency: .inherit,
                                                   target: nil)
    private let sessionManager: SessionManager
    private let defaultHeaders: [String: String]?

    // MARK: Initialization

    public init(checkCredential: Bool = true, defaultHeaders: [String: String]? = nil) {
        self.defaultHeaders = defaultHeaders
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = Alamofire.SessionManager.defaultHTTPHeaders
        sessionManager = Alamofire.SessionManager(configuration: configuration)
        if !checkCredential {
            sessionManager.delegate.sessionDidReceiveChallengeWithCompletion = didReceiveChallenge
        }
    }

    // MARK: - Functions

    @discardableResult
    public func send<T>(request: HttpRequestProtocol, completion: @escaping Completion<T>) -> HttpDataRequestProtocol? {
        guard let url = request.url else {
            completion(.failure(ServiceError.invalidUrl.error))
            return nil
        }
        guard let method = Alamofire.HTTPMethod(rawValue: request.method.rawValue) else {
            completion(.failure(ServiceError.invalidMethod.error))
            return nil
        }

        let headers: [String: String] = (defaultHeaders ?? [:])
            .merging((request.headers ?? [:]), uniquingKeysWith: { (_, new) in new })
        let dataRequest = sessionManager.request(url,
                                                 method: method,
                                                 parameters: request.parameters,
                                                 encoding: Alamofire.URLEncoding.default,
                                                 headers: headers.isEmpty ? nil : headers)
                                        .validate(contentType: [request.contentType])
                                        .validate(statusCode: request.validCodes)
        dataRequest.responseData(queue: dispatchQueue, completionHandler: { response in
            switch response.result {
            case .success(let data):
                switch data.decode(T.self) {
                case .failure(let error):
                    completion(.failure(ServiceError.decode.error.underlying(error)))
                case .success(let result):
                    completion(.success(result))
                }
            case .failure(let error as URLError):
                switch error.code {
                case .cancelled:
                    completion(.failure(ServiceError.cancelled.error.underlying(error)))
                default:
                    completion(.failure(ServiceError.get.error.underlying(error)))
                }
            case .failure(let error):
                completion(.failure(ServiceError.get.error.underlying(error)))
            }
        })
        return dataRequest
    }

    public func cancel(request: HttpDataRequestProtocol) {
        request.cancel()
    }

    // MARK: - Private functions

    //swiftlint:disable:next line_length
    private func didReceiveChallenge(session: URLSession, challenge: URLAuthenticationChallenge, completion: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
        var credential: URLCredential?
        if let serverTrust = challenge.protectionSpace.serverTrust {
            credential = URLCredential(trust: serverTrust)
        }
        completion(.useCredential, credential)
    }
}
