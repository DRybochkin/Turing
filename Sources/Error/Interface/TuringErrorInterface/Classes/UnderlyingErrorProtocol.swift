//
//  UnderlyingErrorProtocol.swift
//  TuringErrorInterface
//
//  Created by Dmitry Rybochkin on 09.04.2019.
//  Copyright © 2019 Dmitry Rybochkin. All rights reserved.
//

public protocol UnderlyingErrorProtocol: Error {

    // MARK: - Properties

    var code: ErrorCodeProtocol { get }
    var description: String { get }
    var debugDescription: String { get }
    var path: String { get }
    var domain: String { get }
    var domainCode: String { get }
    var underlying: UnderlyingErrorProtocol? { get }
    var userInfo: [AnyHashable: Any]? { get }
    var underlyingUserInfo: [AnyHashable: Any]? { get }

    // MARK: - Functions

    func underlying(_ error: Error) -> Self
    func info(_ info: [AnyHashable: Any]) -> Self
}
