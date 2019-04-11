//
//  TuringErrorProtocol.swift
//  TuringError
//
//  Created by Dmitry Rybochkin on 09.04.2019.
//  Copyright © 2019 Turing. All rights reserved.
//

import Foundation

public protocol TuringErrorProtocol {

    // MARK: - Types

    typealias Info = [AnyHashable: Any]

    // MARK: - Properties

    var underlying: TuringErrorProtocol? { get }
    var domain: String { get }
    var domainCode: String { get }
    var code: TuringErrorCodeProtocol { get }
    var userInfo: Info? { get }
    var description: String { get }
    var path: String { get }
}
