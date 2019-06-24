//
//  DIItem.swift
//  TuringDI
//
//  Created by Dmitry Rybochkin on 12/04/2019.
//  Copyright (c) 2019 Dmitry Rybochkin. All rights reserved.
//

import Foundation

extension DIContainer {

    public final class Item {

        // MARK: - Properties

        let protocolType: Any.Type
        let types: [Any.Type]
        let factory: Factory
        let completion: Any?
        var assembly: Any?

        // MARK: - Initialization

        init(protocolType: Any.Type, types: [Any.Type], factory: Factory, completion: Any?) {
            self.protocolType = protocolType
            self.factory = factory
            self.assembly = nil
            self.completion = completion
            self.types = types
        }

        // MARK: - Functions

        func isAnyType(in index: Int) -> Bool {
            guard types.indices.contains(index) else {
                return false
            }
            let type = types[index]
            return type == Any.self || type == Any?.self
        }
    }
}
