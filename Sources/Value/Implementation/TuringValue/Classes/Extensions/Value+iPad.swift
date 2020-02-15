//
//  Value+iPad.swift
//  TuringValue
//
//  Created by Dmitry Rybochkin on 14/06/2019.
//  Copyright © 2019 Dmitry Rybochkin. All rights reserved.
//

extension TuringValue {

    // MARK: - Functions

    public func ipad(_ value: T) -> Self {
        add(orientation, width: .any, height: .any, device: .ipad, value: value)
        return self
    }

    public func ipadpro105(_ value: T) -> Self {
        add(orientation, width: .any, height: .any, device: .ipadpro105, value: value)
        return self
    }

    public func ipadpro11(_ value: T) -> Self {
        add(orientation, width: .any, height: .any, device: .ipadpro11, value: value)
        return self
    }

    public func ipadpro(_ value: T) -> Self {
        add(orientation, width: .any, height: .any, device: .ipadpro, value: value)
        return self
    }

    public func ipads(_ main: T, pro: T) -> Self {
        add(orientation, width: .any, height: .any, device: .ipad, value: main)
        add(orientation, width: .any, height: .any, device: .ipadpro105, value: main)
        add(orientation, width: .any, height: .any, device: .ipadpro11, value: main)
        add(orientation, width: .any, height: .any, device: .ipadpro, value: pro)
        return self
    }

    public func ipads(_ main: T) -> Self {
        add(orientation, width: .any, height: .any, device: .ipad, value: main)
        add(orientation, width: .any, height: .any, device: .ipadpro105, value: main)
        add(orientation, width: .any, height: .any, device: .ipadpro11, value: main)
        add(orientation, width: .any, height: .any, device: .ipadpro, value: main)
        return self
    }
}
