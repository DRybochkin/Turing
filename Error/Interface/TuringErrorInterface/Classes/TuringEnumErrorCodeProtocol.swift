//
//  TuringEnumErrorCodeProtocol.swift
//  TuringError
//
//  Created by Dmitry Rybochkin on 11/04/2019.
//

import Foundation

public protocol TuringEnumErrorCodeProtocol: TuringErrorCodeProtocol {

    // MARK: - Properties

    var domain: String { get }
    var domainCode: String { get }
}
