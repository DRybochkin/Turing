//
//  TuringErrorProtocol+Abstract.swift
//  Nimble
//
//  Created by Dmitry Rybochkin on 10/04/2019.
//

import Foundation
import TuringErrorInterface

public extension TuringErrorProtocol {

    // MARK: - Properties

    var domain: String {
        switch code {
        case let code as TuringEnumErrorCodeProtocol:
            return code.domain
        default:
            return String(describing: type(of: self))
        }
    }

    var path: String {
        return fullPath(paths: []).compactMap({
            switch $0.code {
            case let code as TuringEnumErrorCodeProtocol:
                return "\(code.domainCode)\(code.path)"
            default:
                return "\($0.domainCode)\($0.code.path)"
            }
        }).joined(separator: "-")
    }

    var description: String {
        return fullPath(paths: []).compactMap({
            switch $0.code {
            case let code as TuringEnumErrorCodeProtocol:
                return "\(code.domain).\(code.description)"
            default:
                return "\($0.domain)\($0.code.description)"
            }
        }).joined(separator: "-")
    }
}

private extension TuringErrorProtocol {

    // MARK: - Private functions

    func fullPath(paths: [TuringErrorProtocol]) -> [TuringErrorProtocol] {
        var newPaths = paths
        let item = self
        newPaths.append(item)
        guard !paths.contains(where: { $0.domain == item.domain && $0.code.rawValue == item.code.rawValue }), let underlying = self.underlying else {
            return newPaths
        }
        return underlying.fullPath(paths: newPaths)
    }
}
