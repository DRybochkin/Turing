//
//  Data+Decodable.swift
//  cbcurrencies
//
//  Created by Dmitry Rybochkin on 03/06/2019.
//  Copyright © 2019 Dmitry Rybochkin. All rights reserved.
//

import Foundation

extension Data {

    // MARK: - Functions

    func baseDecode<T: Decodable>(_ type: T.Type) throws -> T {
        return try JSONDecoder().decode(T.self, from: self)
    }

    func decode<T: Decodable>(_ type: T.Type) -> Result<T, Error> {
        do {
            let result = try baseDecode(T.self)
            return .success(result)
        } catch let error {
            return .failure(error)
        }
    }

    func decode<T: Decodable>() -> Result<T, Error> {
        do {
            let result = try baseDecode(T.self)
            return .success(result)
        } catch let error {
            return .failure(error)
        }
    }
}
