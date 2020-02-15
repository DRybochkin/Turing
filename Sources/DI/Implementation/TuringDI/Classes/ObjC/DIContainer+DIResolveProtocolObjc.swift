//
//  DIContainer+DIResolveProtocolObjc.swift
//  TuringDI
//
//  Created by Dmitriy Rybochkin on 15.02.2020.
//

import Foundation
import TuringDIInterface

@objc
extension DIContainer: DIResolveProtocolObjc {

    // MARK: - Public functions

    public func resolve(name: String) -> Any? {
        return resolve()
    }

    public func resolve(class value: AnyObject.Type) -> Any? {
        guard let item = getItem(key: "\(value)") else {
            return nil
        }
        let result: AnyObject? = resolve(item: item, scope: .new)
        return result
    }

    public func resolve(protocol value: Protocol) -> Any? {
        guard let item = getItem(key: NSStringFromProtocol(value)) else {
            return nil
        }
        let result: NSObject? = resolve(item: item, scope: .new)
        return result
    }
}

private extension DIContainer {

    // MARK: - Private functions

    private func getItem(key: String) -> Item? {
        return items.sync({ $0[key] })
    }

}
