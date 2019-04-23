//
//  ChildClass.swift
//  TuringDI_Example
//
//  Created by Dmitry Rybochkin on 14/04/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation

protocol ChildProtocol: class {
    var parent: ParentProtocol? { get set }
}

final class ChildClass: ChildProtocol {

    // MARK: - Properties

    weak var parent: ParentProtocol?

    // MARK: - Constructors

    init() {
        parent = nil
    }

    convenience init(parent: ParentProtocol?) {
        self.init()
        self.parent = parent
    }
}
