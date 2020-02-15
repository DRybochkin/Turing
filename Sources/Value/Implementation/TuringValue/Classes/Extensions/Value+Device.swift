//
//  Value+Device.swift
//  TuringValue
//
//  Created by Dmitry Rybochkin on 14/06/2019.
//  Copyright © 2019 Dmitry Rybochkin. All rights reserved.
//

import Foundation

extension TuringValue {

    enum Device: CGSize {

        // MARK: - Cases

        case iphone4 = "{320, 480}"
        case iphone5 = "{320, 568}"
        case iphone6 = "{375, 667}"
        case iphone6p = "{414, 736}"
        case iphonex = "{375, 812}"
        case ipad = "{768, 1024}"
        case iphonexr = "{414, 896}"
        case ipadpro = "{1024, 1366}"
        case ipadpro105 = "{834, 1112}"
        case ipadpro11 = "{834, 1194}"
        case any = "{0, 0}"
    }
}

extension CGSize: ExpressibleByStringLiteral {

    // MARK: - Inialization

    public init(stringLiteral value: String) {
        let size = NSCoder.cgSize(for: value)
        self.init(width: size.width, height: size.height)
    }

    public init(extendedGraphemeClusterLiteral value: String) {
        let size = NSCoder.cgSize(for: value)
        self.init(width: size.width, height: size.height)
    }

    public init(unicodeScalarLiteral value: String) {
        let size = NSCoder.cgSize(for: value)
        self.init(width: size.width, height: size.height)
    }
}
