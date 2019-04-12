//
//  TuringDIItem.swift
//  TuringDI
//
//  Created by Dmitry Rybochkin on 12/04/2019.
//

import Foundation
import TuringDIInterface

extension TuringDI {

    final class Item {

        // MARK: - Properties

        let protocolType: Any.Type
        let factory: Factory
        let scope: TuringDIScopeProtocol
        var assembly: Any?

        // MARK: - Constructors

        init(protocolType: Any.Type, factory: Factory, scope: TuringDIScopeProtocol, assembly: Any? = nil) {
            self.protocolType = protocolType
            self.factory = factory
            self.scope = scope
            self.assembly = assembly
        }
    }
}

