//
//  TuringDISupportable+Abstract.swift
//  TuringDI
//
//  Created by Dmitry Rybochkin on 12/04/2019.
//

import Foundation
import TuringDIInterface

extension TuringDISupportable {

    // MARK: - DISupportable Properties

    var diContainer: TuringDIProtocol {
        return TuringDI.default
    }
}
