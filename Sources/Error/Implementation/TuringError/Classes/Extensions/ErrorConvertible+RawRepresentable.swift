//
//  ErrorConvertible+RawRepresentable.swift
//  TuringError
//
//  Created by Dmitry Rybochkin on 30/05/2019.
//  Copyright © 2019 Dmitry Rybochkin. All rights reserved.
//

import TuringErrorInterface

extension ErrorConvertible where Self: RawRepresentable & ErrorCodeProtocol, RawValue == Int {

    // MARK: - Properties

    public var error: UnderlyingErrorProtocol {
        return UnderlyingError(domain: Self.domain, domainCode: Self.domainCode, code: self)
    }
}
