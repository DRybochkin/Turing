//
//  Value+iPhone.swift
//  TuringValue
//
//  Created by Dmitry Rybochkin on 14/06/2019.
//  Copyright © 2019 Dmitry Rybochkin. All rights reserved.
//

extension TuringValue {

    // MARK: - Functions

    public func iphone4(_ value: T) -> Self {
        add(orientation, width: .any, height: .any, device: .iphone4, value: value)
        return self
    }

    public func iphone5(_ value: T) -> Self {
        add(orientation, width: .any, height: .any, device: .iphone5, value: value)
        return self
    }

    public func iphone6(_ value: T) -> Self {
        add(orientation, width: .any, height: .any, device: .iphone6, value: value)
        return self
    }

    public func iphone6p(_ value: T) -> Self {
        add(orientation, width: .any, height: .any, device: .iphone6p, value: value)
        return self
    }

    public func iphonex(_ value: T) -> Self {
        add(orientation, width: .any, height: .any, device: .iphonex, value: value)
        return self
    }

    public func iphonexr(_ value: T) -> Self {
        add(orientation, width: .any, height: .any, device: .iphonexr, value: value)
        return self
    }

    public func iphones(_ main: T) -> Self {
        add(orientation, width: .any, height: .any, device: .iphone4, value: main)
        add(orientation, width: .any, height: .any, device: .iphone5, value: main)
        add(orientation, width: .any, height: .any, device: .iphone6, value: main)
        add(orientation, width: .any, height: .any, device: .iphone6p, value: main)
        add(orientation, width: .any, height: .any, device: .iphonex, value: main)
        add(orientation, width: .any, height: .any, device: .iphonexr, value: main)
        return self
    }

    public func iphones(iphone5: T, iphone6: T, iphone6p: T) -> Self {
        add(orientation, width: .any, height: .any, device: .iphone5, value: iphone5)
        add(orientation, width: .any, height: .any, device: .iphone6, value: iphone6)
        add(orientation, width: .any, height: .any, device: .iphone6p, value: iphone6p)
        add(orientation, width: .any, height: .any, device: .iphonex, value: iphone6)
        add(orientation, width: .any, height: .any, device: .iphonexr, value: iphone6)
        return self
    }

    public func iphones(iphone5: T, iphone6: T, iphone6p: T, iphonex: T) -> Self {
        add(orientation, width: .any, height: .any, device: .iphone5, value: iphone5)
        add(orientation, width: .any, height: .any, device: .iphone6, value: iphone6)
        add(orientation, width: .any, height: .any, device: .iphone6p, value: iphone6p)
        add(orientation, width: .any, height: .any, device: .iphonex, value: iphonex)
        add(orientation, width: .any, height: .any, device: .iphonexr, value: iphonex)
        return self
    }

    public func iphones(iphone5: T, iphone6: T, iphone6p: T, iphonex: T, iphonexr: T) -> Self {
        add(orientation, width: .any, height: .any, device: .iphone5, value: iphone5)
        add(orientation, width: .any, height: .any, device: .iphone6, value: iphone6)
        add(orientation, width: .any, height: .any, device: .iphone6p, value: iphone6p)
        add(orientation, width: .any, height: .any, device: .iphonex, value: iphonex)
        add(orientation, width: .any, height: .any, device: .iphonexr, value: iphonexr)
        return self
    }
}
