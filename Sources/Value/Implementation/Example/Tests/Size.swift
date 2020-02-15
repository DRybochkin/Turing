//
//  Size.swift
//  TuringValue_Tests
//
//  Created by Dmitriy Rybochkin on 16.02.2020.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Foundation

//swiftlint:disable identifier_name
extension Device {

    enum Size: Int, Comparable {

        // MARK: - Cases

        case unknownSize = 0
        /// iPhone 4, 4s, iPod Touch 4th gen.
        case screen3_5Inch
        /// iPhone 5, 5s, 5c, SE, iPod Touch 5-6th gen.
        case screen4Inch
        /// iPhone 6, 6s, 7, 8
        case screen4_7Inch
        /// iPhone 6+, 6s+, 7+, 8+
        case screen5_5Inch
        /// iPhone X, Xs, 11 Pro
        case screen5_8Inch
        /// iPhone Xr, 11
        case screen6_1Inch
        /// iPhone Xs Max, 11 Pro Max
        case screen6_5Inch
        /// iPad Mini
        case screen7_9Inch
        /// iPad
        case screen9_7Inch
        /// iPad (10.2-inch)
        case screen10_2Inch
        /// iPad Pro (10.5-inch)
        case screen10_5Inch
        /// iPad Pro (11-inch)
        case screen11Inch
        /// iPad Pro (12.9-inch)
        case screen12_9Inch

        // MARK: - Functions

        static func size() -> Size {
            return .screen10_2Inch
        }

        static func < (lhs: Device.Size, rhs: Device.Size) -> Bool {
            return lhs.rawValue < rhs.rawValue
        }

        static func == (lhs: Device.Size, rhs: Device.Size) -> Bool {
            return lhs.rawValue == rhs.rawValue
        }
    }
}
