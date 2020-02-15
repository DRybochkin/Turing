//
//  RecursiveClass.swift
//  TuringDI_Example
//
//  Created by Dmitry Rybochkin on 05/06/2019.
//  Copyright © 2019 Dmitry Rybochkin. All rights reserved.
//pod 

import TuringDIInterface

protocol RecurciveAProtocol {
}

protocol RecurciveBProtocol {
}

final class RecurciveA: RecurciveAProtocol {

    // MARK: - Properties

    let objectB: RecurciveBProtocol!

    // MARK: - Constructors

    init?(di diContainer: DIResolveProtocol) {
        guard let objB: RecurciveBProtocol = diContainer.resolveSingletone() else {
            return nil
        }
        self.objectB = objB
    }

    init(diContainer: DIResolveProtocol) {
        self.objectB = diContainer.resolveSingletone()
    }
}

final class RecurciveB: RecurciveBProtocol {

    // MARK: - Properties

    let objectA: RecurciveAProtocol!

    // MARK: - Constructors

    init?(di diContainer: DIResolveProtocol) {
        guard let objA: RecurciveAProtocol = diContainer.resolveSingletone() else {
            return nil
        }
        self.objectA = objA
    }

    init(diContainer: DIResolveProtocol) {
        self.objectA = diContainer.resolveSingletone()
    }
}
