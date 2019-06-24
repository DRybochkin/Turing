//
//  SafeValue+CustomStringConvertible.swift
//  TuringSafeValue
//
//  Created by Dmitry Rybochkin on 17/04/2019.
//  Copyright (c) 2019 Dmitry Rybochkin. All rights reserved.
//

import Foundation

extension SafeValue: CustomStringConvertible {

    // MARK: - Properties

    public var description: String {
        return "\(value)"
    }
}
