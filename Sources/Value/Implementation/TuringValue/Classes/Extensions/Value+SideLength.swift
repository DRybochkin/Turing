//
//  Value+SideLength.swift
//  TuringValue
//
//  Created by Dmitry Rybochkin on 14/06/2019.
//  Copyright © 2019 Dmitry Rybochkin. All rights reserved.
//

import Foundation
import CoreGraphics

extension TuringValue {

    enum SideLength: CGFloat {

        // MARK: - Cases

        case p320 = 320.0
        case p375 = 375.0
        case p414 = 414.0
        case p480 = 480.0
        case p568 = 568.0
        case p667 = 667.0
        case p736 = 736.0
        case p768 = 768.0
        case p812 = 812.0
        case p834 = 834.0
        case p896 = 896.0
        case p1024 = 1024.0
        case p1112 = 1112.0
        case p1194 = 1194.0
        case p1366 = 1366.0
        case any = 0
    }
}
