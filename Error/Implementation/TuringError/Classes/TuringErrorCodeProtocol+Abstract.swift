//
//  TuringErrorCodeProtocol+Abstract.swift
//  TuringErrorImplementation
//
//  Created by Dmitry Rybochkin on 11/04/2019.
//

import Foundation
import TuringErrorInterface

public extension TuringErrorCodeProtocol {

    // MARK: - Properties

    var path: String {
        return "\(rawValue)"
    }

    var description: String {
        let selfType = "\(self)"
        guard let shortSelfType = selfType.split(separator: "(").first else {
            return selfType
        }

        return String(shortSelfType)
    }
}
