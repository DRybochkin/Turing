//
//  DIProtocolObjc.swift
//  TuringDIInterface
//
//  Created by Dmitriy Rybochkin on 15.02.2020.
//

import Foundation

@objc
public protocol DIProtocolObjc: DIResolveProtocolObjc, DIRegisterProtocolObjc {

    // MARK: - Properties

    @objc
    static var defaultObjc: DIProtocolObjc { get set }
}
