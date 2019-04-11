//
//  TuringErrorCodeProtocol.swift
//  Nimble
//
//  Created by Dmitry Rybochkin on 10/04/2019.
//

import Foundation

public protocol TuringErrorCodeProtocol {

    // MARK: - Properties

    var rawValue: Int { get }
    var path: String { get }
    var description: String { get }
}
