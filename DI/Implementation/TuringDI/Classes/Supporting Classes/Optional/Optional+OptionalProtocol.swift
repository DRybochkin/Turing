//
//  Optional+OptionalProtocol.swift
//  TuringDI
//
//  Created by Dmitry Rybochkin on 31/05/2019.
//  Copyright © 2019 Dmitry Rybochkin. All rights reserved.
//

extension Optional: OptionalProtocol {

    // MARK: - Properties

    static var wrappedType: Any.Type {
        return Wrapped.self
    }
}
