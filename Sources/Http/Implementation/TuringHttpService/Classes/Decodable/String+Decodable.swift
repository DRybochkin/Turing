//
//  String+Decodable.swift
//  cbcurrencies
//
//  Created by Dmitry Rybochkin on 03/06/2019.
//  Copyright © 2019 Dmitry Rybochkin. All rights reserved.
//

import Foundation

extension String {

    // MARK: - Functions

    func baseDecode<T: Decodable>(_ type: T.Type) throws -> T {
        return try Data(utf8).baseDecode(T.self)
    }

    func decode<T: Decodable>(_ type: T.Type) -> Result<T, Error> {
        return Data(utf8).decode(T.self)
    }
}
