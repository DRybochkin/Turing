//
//  TestObject.swift
//  TuringSafe_Tests
//
//  Created by Dmitry Rybochkin on 17/04/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation

final class TestObject: Equatable {

    // MARK: - Properties

    let property1: String
    var property2: Int

    // MARK: - Constructors

    init(property1: String, property2: Int) {
        self.property1 = property1
        self.property2 = property2
    }

    // MARK: - Functions

    static func == (lhs: TestObject, rhs: TestObject) -> Bool {
        return lhs.property1 == rhs.property1 && lhs.property2 == rhs.property2
    }
}
