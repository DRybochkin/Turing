//
//  HttpServiceProtocol.swift
//  TuringHttpServiceInterface
//
//  Updated by Dmitry Rybochkin on 04/06/2019.
//  Copyright © 2017 Turing. All rights reserved.
//

public protocol HttpServiceProtocol {

    // MARK: - Types

    typealias Completion<T: Decodable> = (Result<T, Error>) -> Void

    // MARK: - Functions

    @discardableResult
    func send<T>(request: HttpRequestProtocol, completion: @escaping Completion<T>) -> HttpDataRequestProtocol?
    func cancel(request: HttpDataRequestProtocol)
}
