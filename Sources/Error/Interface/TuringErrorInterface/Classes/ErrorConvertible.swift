//
//  ErrorConvertible.swift
//  TuringErrorInterface
//
//  Created by Dmitry Rybochkin on 30/05/2019.
//  Copyright © 2019 Dmitry Rybochkin. All rights reserved.
//

public protocol ErrorConvertible {

    // MARK: - Properties

    static var domain: String { get }
    static var domainCode: String { get }
    var error: UnderlyingErrorProtocol { get }
}
