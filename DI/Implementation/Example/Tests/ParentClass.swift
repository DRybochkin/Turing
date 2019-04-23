//
//  ParentClass.swift
//  TuringDI_Example
//
//  Created by Dmitry Rybochkin on 14/04/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation

protocol ParentProtocol: class {
    var property1: ChildProtocol? { get set }
    var property2: Int { get }
    var property3: String { get }
    var property4: Any? { get }
}

final class ParentClass: ParentProtocol {

    // MARK: - Properties

    var property1: ChildProtocol?
    var property2: Int
    var property3: String
    var property4: Any?

    // MARK: - Constructors

    init() {
        self.property1 = nil
        self.property2 = 0
        self.property3 = ""
        self.property4 = nil
    }

    convenience init(property1: ChildProtocol?) {
        self.init()
        self.property1 = property1
    }

    convenience init(property1: ChildProtocol?, property2: Int) {
        self.init()
        self.property1 = property1
        self.property2 = property2
    }

    convenience init(property3: String, property4: Any?) {
        self.init()
        self.property3 = property3
        self.property4 = property4
    }

    convenience init(property2: Int, property3: String, property4: Any?) {
        self.init()
        self.property2 = property2
        self.property3 = property3
        self.property4 = property4
    }
}

extension ParentClass: Equatable {

    // MARK: - Functions

    static func == (lhs: ParentClass, rhs: ParentClass) -> Bool {
        return lhs.property1 === rhs.property1 &&
            lhs.property2 == rhs.property2 &&
            lhs.property3 == rhs.property3
    }
}
