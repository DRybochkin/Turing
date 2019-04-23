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
        let types: [Any.Type]
        let factory: Factory
        let completion: Any?
        var assembly: Any?

        // MARK: - Constructors

        init(protocolType: Any.Type, types: [Any.Type], factory: Factory, completion: Any?) {
            self.protocolType = protocolType
            self.factory = factory
            self.assembly = nil
            self.completion = completion
            self.types = types
        }

        // MARK: - Constructors

        func isAnyType(in index: Int) -> Bool {
            guard index >= 0, index < types.count else {
                return false
            }
            let type = types[index]
            return type == Any.self || type == Any?.self
        }
    }
}
