//
//  DIProtocol.swift
//  TuringDIInterface
//
//  Created by Dmitry Rybochkin on 09.04.2019.
//  Copyright © 2019 Dmitry Rybochkin. All rights reserved.
//

import Foundation

public protocol DIProtocol: class, DIResolveProtocol, DIRegisterProtocol {

    // MARK: - Properties

    static var `default`: DIProtocol { get set }
}
