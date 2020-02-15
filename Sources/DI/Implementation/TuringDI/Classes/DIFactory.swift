//
//  DIFactory.swift
//  TuringDI
//
//  Created by Dmitry Rybochkin on 12/04/2019.
//  Copyright (c) 2019 Dmitry Rybochkin. All rights reserved.
//

import Foundation

extension DIContainer {

    public enum Factory {

        // MARK: - Cases

        case empty(Any)
        case zero(Any)
        case one(Any)
        case two(Any)
        case three(Any)
    }
}
