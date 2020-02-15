//
//  DIRegistrable.swift
//  TuringDIInterface
//
//  Created by Dmitry Rybochkin on 31/05/2019.
//  Copyright © 2019 Dmitry Rybochkin. All rights reserved.
//

public protocol DIRegistrable {

    // MARK: - Functions

    static func register(in diContainer: DIProtocol)
}
