//
//  DIScope.swift
//  TuringDI
//
//  Created by Dmitry Rybochkin on 31/05/2019.
//  Copyright © 2019 Dmitry Rybochkin. All rights reserved.
//

import TuringDIInterface

extension DIContainer {

    enum Scope: DIScopeProtocol {

        // MARK: - Cases

        case new
        case singleton
    }
}
