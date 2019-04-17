//
//  TuringSafeValue+CustomStringConvertible.swift
//  TuringSafeValue
//
//  Created by Dmitry Rybochkin on 17/04/2019.
//

import Foundation

extension TuringSafeValue: CustomStringConvertible {

    // MARK: - Properties

    public var description: String {
        return "\(value)"
    }
}
