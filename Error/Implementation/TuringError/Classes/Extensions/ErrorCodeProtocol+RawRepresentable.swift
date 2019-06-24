//
//  ErrorCodeProtocol+RawRepresentable.swift
//  TuringError
//
//  Created by Dmitry Rybochkin on 30/05/2019.
//  Copyright © 2019 Dmitry Rybochkin. All rights reserved.
//

import TuringErrorInterface

extension ErrorCodeProtocol where Self: RawRepresentable, RawValue == Int {

    // MARK: - Properties

    public var code: Int {
        return rawValue
    }

    public var name: String {
        return "\(self)"
    }
}
