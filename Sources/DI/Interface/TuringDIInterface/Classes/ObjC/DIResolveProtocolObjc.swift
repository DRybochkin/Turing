//
//  DIResolveProtocolObjc.swift
//  TuringDIInterface
//
//  Created by Dmitriy Rybochkin on 15.02.2020.
//

import Foundation

@objc
public protocol DIResolveProtocolObjc: class {

    // MARK: - Public functions

    @objc
    func resolve(name: String) -> Any?
    @objc
    func resolve(class: AnyClass) -> Any?
    @objc
    func resolve(protocol: Protocol) -> Any?
}
