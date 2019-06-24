//
//  DISupportable+Abstract.swift
//  Dmitry Rybochkin
//
//  Created by Dmitry Rybochkin on 12/04/2019.
//  Copyright (c) 2019 Dmitry Rybochkin. All rights reserved.
//

import Foundation
import TuringDIInterface

extension DISupportable {

    // MARK: - DISupportable Properties

    public var diContainer: DIProtocol {
        return DIContainer.default
    }
}
