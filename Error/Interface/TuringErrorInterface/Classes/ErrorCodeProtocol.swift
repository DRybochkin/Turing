//
//  ErrorCodeProtocol.swift
//  TuringErrorInterface
//
//  Created by Dmitry Rybochkin on 30/05/2019.
//  Copyright © 2019 Dmitry Rybochkin. All rights reserved.
//

public protocol ErrorCodeProtocol {

    // MARK: - Properties

    var code: Int { get }
    var name: String { get }
}
