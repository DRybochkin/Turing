//
//  Error+UnderlyingErrorProtocol.swift
//  TuringError
//
//  Created by Dmitry Rybochkin on 04/06/2019.
//  Copyright © 2019 Dmitry Rybochkin. All rights reserved.
//

import TuringErrorInterface

extension Error {

    // MARK: - Properties

    private var underlying: UnderlyingErrorProtocol? {
        return self as? UnderlyingErrorProtocol
    }

    public var description: String {
        return underlying?.description ?? localizedDescription
    }

    public var debugDescription: String {
        return underlying?.debugDescription ?? localizedDescription
    }

    public var path: String {
        return underlying?.path ?? ""
    }

    public var underlyingUserInfo: [AnyHashable: Any]? {
        guard let underlying = underlying, let underlyingUserInfo = underlying.underlyingUserInfo else {
            return nil
        }
        return underlyingUserInfo
    }
}
