//
//  Value+Get.swift
//  TuringValue
//
//  Created by Dmitry Rybochkin on 14/06/2019.
//  Copyright © 2019 Dmitry Rybochkin. All rights reserved.
//

import UIKit

extension TuringValue {

    // MARK: - Functions

    public func get(for forOrientation: Orientation = .any) -> T {
        let displayWidth = UIScreen.main.bounds.width
        let displayheight = UIScreen.main.bounds.height

        var width = SideLength(rawValue: displayWidth) ?? SideLength.any
        var height = SideLength(rawValue: displayheight) ?? SideLength.any

        var orientation: Orientation = (width.rawValue > height.rawValue) ? .landscape : .portrait
        if forOrientation != .any, orientation != forOrientation {
            orientation = forOrientation
            let tmpWidth = width
            width = height
            height = tmpWidth
        }

        let device: Device
        switch orientation {
        case .landscape:
            device = Device(rawValue: CGSize(width: height.rawValue, height: width.rawValue)) ?? .any
        case .portrait:
            device = Device(rawValue: CGSize(width: width.rawValue, height: height.rawValue)) ?? .any
        case .any:
            device = .any
        }

        let widths: Widths? = tree[orientation] != nil ? tree[orientation] : tree[.any]
        let heights: Heights? = widths?[width] != nil ? widths?[width] : widths?[.any]
        let devices: Devices? = heights?[height] != nil ? heights?[height] : heights?[.any]

        if let value = devices?[device] {
            return value
        }
        if let value = devices?[.any] {
            return value
        }
        if let value = tree[.any]?[.any]?[.any]?[.any] {
            return value
        }
        return defaultValue
    }
}
