//
//  DIContainer+DIProtocolObjc.swift
//  TuringDI
//
//  Created by Dmitriy Rybochkin on 15.02.2020.
//

import Foundation
import TuringDIInterface

@objc
extension DIContainer: DIProtocolObjc {

    // MARK: - Public properties

    public static var defaultObjc: DIProtocolObjc {
        get {
            return (self.default as? DIProtocolObjc) ?? DIContainer()
        }
        set {
            self.default = (newValue as? DIProtocol) ?? DIContainer()
        }
    }
}
