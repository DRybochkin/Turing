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
        let completion: Any?
        var assembly: Any?

        // MARK: - Constructors

        init(protocolType: Any.Type, factory: Factory, completion: Any?) {
            self.protocolType = protocolType
            self.factory = factory
            self.assembly = nil
            self.completion = completion
        }
    }
}

