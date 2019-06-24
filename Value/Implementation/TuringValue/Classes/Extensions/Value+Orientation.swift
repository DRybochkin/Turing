//
//  Value+Orientation.swift
//  TuringValue
//
//  Created by Dmitry Rybochkin on 14/06/2019.
//  Copyright © 2019 Dmitry Rybochkin. All rights reserved.
//

extension TuringValue {

    public enum Orientation {

        // MARK: - Cases

        case landscape
        case portrait
        case any
    }

    // MARK: - Functions

    public func landscape() -> Self {
        orientation = .landscape
        return self
    }

    public func portrait() -> Self {
        orientation = .portrait
        return self
    }

    public func ipadsWithIphone6pLand(_ value: T) -> Self {
        return ipads(value, pro: value).landscape().iphone6p(value)
    }
}
