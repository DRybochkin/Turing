//
//  ChildClass.swift
//  TuringDI_Example
//
//  Created by Dmitry Rybochkin on 14/04/2019.
//  Copyright (c) 2019 Dmitry Rybochkin. All rights reserved.
//

import Foundation
import TuringDIInterface

protocol ChildProtocol: class {
    var parent: ParentProtocol? { get set }
    var value: Int { get }
}

final class ChildClass: ChildProtocol {

    // MARK: - Properties

    weak var parent: ParentProtocol?
    var value: Int = 0

    // MARK: - Constructors

    init() {
        parent = nil
    }

    init(value: Int) {
        parent = nil
        self.value = value
    }

    init(di diContainer: DIResolveProtocol) {
        _ = diContainer.resolve(ChildProtocol.self)
        parent = nil
    }

    convenience init(parent: ParentProtocol?) {
        self.init()
        self.parent = parent
    }
}
