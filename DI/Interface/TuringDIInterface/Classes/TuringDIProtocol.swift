//
//  TuringDIProtocol.swift
//  TuringDI
//
//  Created by Dmitry Rybochkin on 09.04.2019.
//  Copyright © 2019 Turing. All rights reserved.
//

import Foundation

public protocol TuringDIProtocol: class, TuringDIResolveProtocol, TuringDIRegisterProtocol {

    // MARK: - Properties

    static var `default`: TuringDIProtocol { get set }
    var maxRecursiveDepth: Int { get set }
}
