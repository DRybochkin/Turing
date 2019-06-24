//
//  OptionalProtocol.swift
//  TuringDI
//
//  Created by Dmitry Rybochkin on 22/04/2019.
//  Copyright © 2019 Dmitry Rybochkin. All rights reserved.
//

protocol OptionalProtocol {

    // MARK: - Properties

    static var wrappedType: Any.Type { get }
}
