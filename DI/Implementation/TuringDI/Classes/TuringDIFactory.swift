//
//  TuringDIFactory.swift
//  TuringDI
//
//  Created by Dmitry Rybochkin on 12/04/2019.
//

import Foundation

extension TuringDI {

    enum Factory {

        // MARK: - Cases

        case empty(Any)
        case parameters(Any)
        case container(Any)
        case containerAndParameters(Any)
    }
}

