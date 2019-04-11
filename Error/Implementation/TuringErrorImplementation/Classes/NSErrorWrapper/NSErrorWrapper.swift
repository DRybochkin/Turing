//
//  NSErrorWrapper.swift
//  TuringErrorImplementation
//
//  Created by Dmitry Rybochkin on 11/04/2019.
//

import Foundation
import TuringErrorInterface

struct NSErrorWrapper: TuringErrorProtocol {

    // MARK: - Properties

    let underlying: TuringErrorProtocol? = nil
    let domain: String
    let domainCode: String
    let code: TuringErrorCodeProtocol
    let userInfo: Info?

    // MARK: - Constructors

    init(error: NSError) {
        domain = error.domain
        domainCode = error.domain
        userInfo = error.userInfo
        code = NSErrorCodeWrapper.custom(error)
    }
}
